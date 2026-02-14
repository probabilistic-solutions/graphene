// Export LiveView hooks here so they are available as `import { Hooks } from "graphene"`.

type TableEventDetail = {
  selectedRow?: HTMLElement | null;
  selectedRows?: HTMLElement[];
  sortedHeader?: HTMLElement | null;
  unfilteredRows?: HTMLElement[];
  value?: string;
  searchValue?: string;
};

type TableEvent = CustomEvent & { detail?: TableEventDetail };

type TablePayload = {
  selected_id: string | null;
  selected_ids: string[];
  column_index: number | null;
  unfiltered_ids: string[];
  search: string | null;
};

const TABLE_EVENTS: Record<string, string> = {
  "cds-table-row-selected": "graphene:table-row-selected",
  "cds-table-row-all-selected": "graphene:table-row-all-selected",
  "cds-table-sorted": "graphene:table-sorted",
  "cds-table-filtered": "graphene:table-filtered",
  "cds-search-input": "graphene:table-search-input",
  "cds-table-batch-actions-cancel-clicked": "graphene:table-batch-cancel"
};

const CARBON_PREFIX = "cds";

const rowId = (row: HTMLElement | null | undefined): string | null => {
  if (!row) return null;
  return row.dataset?.rowId || row.getAttribute("data-row-id") || row.id || null;
};

const rowIds = (rows?: HTMLElement[]): string[] =>
  (rows || [])
    .map((row) => rowId(row))
    .filter((value): value is string => Boolean(value));

const buildPayload = (event: TableEvent, root: HTMLElement): TablePayload => {
  const detail = event.detail || {};
  const selectedRows =
    Array.isArray(detail.selectedRows) && detail.selectedRows.length > 0
      ? detail.selectedRows
      : Array.from(root.querySelectorAll<HTMLElement>("cds-table-row[selected]"));
  const unfilteredRows =
    Array.isArray(detail.unfilteredRows) && detail.unfilteredRows.length > 0
      ? detail.unfilteredRows
      : Array.from(root.querySelectorAll<HTMLElement>("cds-table-row:not([filtered])"));

  return {
    selected_id: rowId(detail.selectedRow || null),
    selected_ids: rowIds(selectedRows),
    column_index: detail.sortedHeader?.dataset
      ? Number(detail.sortedHeader.dataset.colIndex)
      : null,
    unfiltered_ids: rowIds(unfilteredRows),
    search: detail.value || detail.searchValue || null
  };
};

const selectionSignature = (root: HTMLElement): string => {
  const selectedRows = Array.from(root.querySelectorAll<HTMLElement>("cds-table-row[selected]"));
  const selected = rowIds(selectedRows).sort();
  return selected.join("|");
};

const updateTableSelectionUI = (table: any, selectedCount: number) => {
  const tableRows: HTMLElement[] =
    table?._tableRows && table._tableRows.length > 0
      ? Array.from(table._tableRows as HTMLElement[])
      : Array.from((table as HTMLElement).querySelectorAll("cds-table-row"));
  const totalSelectableRows = tableRows.filter(
    (row) => !row.hasAttribute("filtered") && !row.hasAttribute("disabled")
  ).length;
  const headerCheckbox = table?._tableHeaderRow?.shadowRoot
    ?.querySelector(`${CARBON_PREFIX}-checkbox`)
    ?.shadowRoot?.querySelector(`.${CARBON_PREFIX}--checkbox`);

  if (headerCheckbox) {
    headerCheckbox.checked = selectedCount > 0;
    headerCheckbox.indeterminate = selectedCount > 0 && selectedCount < totalSelectableRows;
  }

  if (table?._tableBatchActions) {
    table._tableBatchActions.active = selectedCount > 0;
    table._tableBatchActions.selectedRowsCount = selectedCount;
  }

  if (table?._tableToolbarContent) {
    table._tableToolbarContent.hasBatchActions = selectedCount > 0;
  }
};

const syncSelection = async (hook: any) => {
  const root = hook.el as HTMLElement;

  await Promise.all([
    customElements.whenDefined("cds-table"),
    customElements.whenDefined("cds-table-row"),
    customElements.whenDefined("cds-table-header-row")
  ]);

  const table: any = root;
  if (table?.updateComplete) {
    await table.updateComplete;
  }
  const rows = Array.from(root.querySelectorAll<HTMLElement>("cds-table-row"));
  if (!rows.length) return;

  await Promise.all(
    rows
      .map((row) => (row as any).updateComplete)
      .filter((value) => value && typeof value.then === "function")
  );

  const desiredRows = rows.filter((row) => row.hasAttribute("selected"));

  rows.forEach((row) => {
    const desired = row.hasAttribute("selected");
    if ((row as any).selected !== desired) {
      (row as any).selected = desired;
    }
  });

  const currentRows: HTMLElement[] = Array.isArray(table._selectedRows) ? table._selectedRows : [];
  const desiredSet = new Set(desiredRows);
  const currentSet = new Set(currentRows);
  let changed = false;

  desiredRows.forEach((row) => {
    if (!currentSet.has(row)) changed = true;
  });

  currentRows.forEach((row) => {
    if (!desiredSet.has(row)) changed = true;
  });

  if (changed) {
    table._selectedRows = [...desiredRows];
    updateTableSelectionUI(table, desiredRows.length);
  }
};

const syncSelectionWithSignature = (hook: any) => {
  const signature = selectionSignature(hook.el as HTMLElement);
  if (hook._basicComponentsTableSelectionSignature === signature) return;
  hook._basicComponentsTableSelectionSignature = signature;
  void syncSelection(hook);
};

export const BasicComponentsTable: any = {
  mounted(this: any) {
    const handlers: Record<string, (event: TableEvent) => void> = {};

    Object.entries(TABLE_EVENTS).forEach(([eventName, pushEventName]) => {
      const handler = (event: TableEvent) => {
        this.pushEventTo(this.el, pushEventName, buildPayload(event, this.el));
      };

      handlers[eventName] = handler;
      this.el.addEventListener(eventName, handler);
    });

    this._basicComponentsTableHandlers = handlers;
    syncSelectionWithSignature(this);
  },

  updated(this: any) {
    syncSelectionWithSignature(this);
  },

  destroyed(this: any) {
    const handlers = this._basicComponentsTableHandlers || {};

    Object.entries(handlers).forEach(([eventName, handler]) => {
      this.el.removeEventListener(eventName, handler);
    });

    this._basicComponentsTableHandlers = {};
  }
};
