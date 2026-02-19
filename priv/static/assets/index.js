import {
  __export
} from "./chunks/chunk-G6EI4S4W.js";

// src/lib/hooks/index.ts
var hooks_exports = {};
__export(hooks_exports, {
  BasicComponentsTable: () => BasicComponentsTable
});

// src/lib/hooks/table.ts
var TABLE_EVENTS = {
  "cds-table-row-selected": "graphene:table-row-selected",
  "cds-table-row-all-selected": "graphene:table-row-all-selected",
  "cds-table-sorted": "graphene:table-sorted",
  "cds-table-filtered": "graphene:table-filtered",
  "cds-search-input": "graphene:table-search-input",
  "cds-table-batch-actions-cancel-clicked": "graphene:table-batch-cancel"
};
var CARBON_PREFIX = "cds";
var rowId = (row) => {
  var _a;
  if (!row)
    return null;
  if (typeof row === "string" || typeof row === "number")
    return String(row);
  if (typeof row === "object") {
    if (typeof row.rowId === "string" || typeof row.rowId === "number")
      return String(row.rowId);
    if (typeof row.row_id === "string" || typeof row.row_id === "number")
      return String(row.row_id);
    if (typeof row.id === "string" || typeof row.id === "number")
      return String(row.id);
  }
  if ((_a = row.dataset) == null ? void 0 : _a.rowId)
    return row.dataset.rowId;
  if (row.getAttribute) {
    return row.getAttribute("data-row-id") || row.getAttribute("id");
  }
  return row.id || null;
};
var rowIds = (rows) => (rows || []).map((row) => rowId(row)).filter((value) => Boolean(value));
var buildPayload = (event, root) => {
  var _a, _b, _c, _d, _e, _f, _g, _h, _i;
  const detail = event.detail || {};
  const isSimulated = detail.__simulated === true;
  const selectedRowsFromDetail = Array.isArray(detail.selectedRows) ? detail.selectedRows : detail.selectedRows && typeof detail.selectedRows[Symbol.iterator] === "function" ? Array.from(detail.selectedRows) : [];
  const selectedRowsFromTable = !isSimulated && Array.isArray(root._selectedRows) ? root._selectedRows : null;
  const selectedIdFromDetail = rowId(detail.selectedRow || null);
  const selectedRowsFromDom = Array.from(root.querySelectorAll("cds-table-row")).filter(
    (row) => row.hasAttribute("selected") || row.selected
  );
  const selectedIdsFromDom = rowIds(selectedRowsFromDom);
  const selectedIdsFromDetail = rowIds(selectedRowsFromDetail);
  let selectedIds = selectedIdsFromDom;
  if (selectedIds.length === 0) {
    if (selectedIdsFromDetail.length > 0) {
      selectedIds = selectedIdsFromDetail;
    } else if (selectedIdFromDetail) {
      selectedIds = [selectedIdFromDetail];
    } else if (selectedRowsFromTable !== null) {
      selectedIds = rowIds(selectedRowsFromTable);
    }
  }
  const unfilteredRowsFromDetail = Array.isArray(detail.unfilteredRows) ? detail.unfilteredRows : detail.unfilteredRows && typeof detail.unfilteredRows[Symbol.iterator] === "function" ? Array.from(detail.unfilteredRows) : [];
  const unfilteredRows = unfilteredRowsFromDetail.length > 0 ? unfilteredRowsFromDetail : Array.from(root.querySelectorAll("cds-table-row")).filter(
    (row) => !row.hasAttribute("filtered") && !row.filtered
  );
  const columnIndexValue = (_i = (_h = (_g = (_f = (_d = (_b = (_a = detail.sortedHeader) == null ? void 0 : _a.dataset) == null ? void 0 : _b.colIndex) != null ? _d : (_c = detail.sortedHeader) == null ? void 0 : _c.colIndex) != null ? _f : (_e = detail.sortedHeader) == null ? void 0 : _e.columnIndex) != null ? _g : detail.columnIndex) != null ? _h : detail.colIndex) != null ? _i : null;
  const columnIndex = columnIndexValue === null || columnIndexValue === void 0 ? null : Number(columnIndexValue);
  return {
    selected_id: selectedIdFromDetail,
    selected_ids: selectedIds,
    column_index: Number.isNaN(columnIndex) ? null : columnIndex,
    unfiltered_ids: rowIds(unfilteredRows),
    search: detail.value || detail.searchValue || null
  };
};
var selectionSignature = (root) => {
  const selectedRows = Array.from(root.querySelectorAll("cds-table-row")).filter(
    (row) => row.hasAttribute("selected") || row.selected
  );
  const selected = rowIds(selectedRows).sort();
  return selected.join("|");
};
var parseSelectedIds = (root) => {
  const raw = root.dataset.selectedIds;
  if (raw === void 0)
    return null;
  if (raw.trim() === "")
    return /* @__PURE__ */ new Set();
  const ids = raw.split(",").map((value) => value.trim()).filter((value) => value.length > 0);
  return new Set(ids);
};
var applySelectedIdsFromDataset = (root) => {
  const desiredIds = parseSelectedIds(root);
  if (!desiredIds)
    return false;
  const rows = Array.from(root.querySelectorAll("cds-table-row"));
  let changed = false;
  rows.forEach((row) => {
    const id = rowId(row);
    if (!id)
      return;
    const shouldSelect = desiredIds.has(id);
    const currentlySelected = row.hasAttribute("selected") || row.selected;
    if (shouldSelect !== currentlySelected) {
      changed = true;
      if (shouldSelect) {
        row.setAttribute("selected", "");
      } else {
        row.removeAttribute("selected");
      }
      row.selected = shouldSelect;
    }
  });
  return changed;
};
var updateTableSelectionUI = (table, selectedCount) => {
  var _a, _b, _c, _d;
  const tableRows2 = (table == null ? void 0 : table._tableRows) && table._tableRows.length > 0 ? Array.from(table._tableRows) : Array.from(table.querySelectorAll("cds-table-row"));
  const totalSelectableRows = tableRows2.filter(
    (row) => !row.hasAttribute("filtered") && !row.hasAttribute("disabled")
  ).length;
  const headerCheckbox = (_d = (_c = (_b = (_a = table == null ? void 0 : table._tableHeaderRow) == null ? void 0 : _a.shadowRoot) == null ? void 0 : _b.querySelector(`${CARBON_PREFIX}-checkbox`)) == null ? void 0 : _c.shadowRoot) == null ? void 0 : _d.querySelector(`.${CARBON_PREFIX}--checkbox`);
  if (headerCheckbox) {
    headerCheckbox.checked = selectedCount > 0;
    headerCheckbox.indeterminate = selectedCount > 0 && selectedCount < totalSelectableRows;
  }
  if (table == null ? void 0 : table._tableBatchActions) {
    table._tableBatchActions.active = selectedCount > 0;
    table._tableBatchActions.selectedRowsCount = selectedCount;
  }
  if (table == null ? void 0 : table._tableToolbarContent) {
    table._tableToolbarContent.hasBatchActions = selectedCount > 0;
  }
};
var ensureSearchValue = (table) => {
  if (!table)
    return;
  if (table._searchValue === void 0 || table._searchValue === null) {
    table._searchValue = "";
  }
};
var ensureFilterRows = (table) => {
  if (!table || typeof table.filterRows !== "function")
    return;
  if (table._grapheneFilterRowsWrapped)
    return;
  const original = table.filterRows;
  table.filterRows = (rowText, searchString) => {
    const safeRowText = typeof rowText === "string" ? rowText : "";
    const safeSearch = typeof searchString === "string" ? searchString : "";
    try {
      return original.call(table, safeRowText, safeSearch);
    } catch (_error) {
      return safeRowText.toLowerCase().indexOf(safeSearch.toLowerCase()) < 0;
    }
  };
  table._grapheneFilterRowsWrapped = true;
};
var tableRows = (root) => Array.from(root.querySelectorAll("cds-table-row"));
var tableHeaderCells = (root) => Array.from(root.querySelectorAll("cds-table-header-cell"));
var setRowSelected = (row, selected) => {
  if (selected) {
    row.setAttribute("selected", "");
  } else {
    row.removeAttribute("selected");
  }
  row.selected = selected;
};
var applySelection = (hook, selectedIds, sourceRowId, eventName) => {
  const table = hook.el;
  const isRadio = table.radio === true || table.radio === "true" || table.hasAttribute("radio");
  const effectiveSelectedIds = isRadio ? new Set(sourceRowId ? [sourceRowId] : []) : selectedIds;
  const rows = tableRows(table);
  const selectedRows = [];
  rows.forEach((row) => {
    const id = rowId(row);
    if (!id)
      return;
    const shouldSelect = effectiveSelectedIds.has(id);
    setRowSelected(row, shouldSelect);
    if (shouldSelect) {
      selectedRows.push(row);
    }
  });
  table._selectedRows = selectedRows;
  updateTableSelectionUI(table, selectedRows.length);
  hook._basicComponentsTableSelectionSignature = selectionSignature(table);
  const selectedRow = sourceRowId !== null ? rows.find((row) => rowId(row) === sourceRowId) || null : null;
  const payload = buildPayload(
    { detail: { selectedRow, selectedRows } },
    table
  );
  hook.pushEventTo(table, eventName, payload);
};
var applySort = (hook, columnIndex, direction) => {
  const table = hook.el;
  const tbody = table.querySelector("cds-table-body");
  if (!tbody)
    return;
  const rows = tableRows(table);
  const isExpandable = table.expandable === true || table.expandable === "true" || table.hasAttribute("expandable");
  const rowPairs = rows.map((row) => {
    const next = row.nextElementSibling;
    const expanded = next && next.matches && next.matches("cds-table-expanded-row") ? next : null;
    return { row, expanded };
  });
  const sorted = [...rowPairs].sort((rowA, rowB) => {
    var _a, _b, _c, _d;
    const cellA = rowA.row.querySelectorAll("cds-table-cell")[columnIndex];
    const cellB = rowB.row.querySelectorAll("cds-table-cell")[columnIndex];
    const textA = (_b = (_a = cellA == null ? void 0 : cellA.textContent) == null ? void 0 : _a.trim()) != null ? _b : "";
    const textB = (_d = (_c = cellB == null ? void 0 : cellB.textContent) == null ? void 0 : _c.trim()) != null ? _d : "";
    const comparison = textA.localeCompare(textB, void 0, { numeric: true, sensitivity: "base" });
    return direction === "descending" ? -comparison : comparison;
  });
  if (isExpandable) {
    sorted.forEach(({ row, expanded }) => {
      tbody.appendChild(row);
      if (expanded) {
        tbody.appendChild(expanded);
      }
    });
  } else {
    sorted.forEach(({ row }) => tbody.appendChild(row));
  }
  const headers = tableHeaderCells(table);
  headers.forEach((header) => {
    if (header.getAttribute("data-col-index") === String(columnIndex)) {
      header.setAttribute("sort-active", "");
      header.setAttribute("sort-direction", direction);
    } else {
      header.removeAttribute("sort-active");
      header.setAttribute("sort-direction", "none");
    }
  });
  const payload = buildPayload(
    { detail: { sortedHeader: { dataset: { colIndex: String(columnIndex) } } } },
    table
  );
  hook.pushEventTo(table, "graphene:table-sorted", payload);
};
var applySearch = (hook, value) => {
  var _a, _b, _c, _d;
  const table = hook.el;
  const searchValue = value != null ? value : "";
  let unfilteredRows = [];
  if (typeof table._handleFilterRows === "function") {
    table._searchValue = searchValue;
    try {
      table._handleFilterRows();
      unfilteredRows = tableRows(table).filter(
        (row) => !row.hasAttribute("filtered") && !row.filtered
      );
    } catch (_error) {
      const rows = tableRows(table);
      const normalized = searchValue.toLowerCase();
      rows.forEach((row) => {
        var _a2, _b2;
        const rowText = (_b2 = (_a2 = row.textContent) == null ? void 0 : _a2.trim().toLowerCase()) != null ? _b2 : "";
        const filtered = normalized.length > 0 && !rowText.includes(normalized);
        row.filtered = filtered;
        if (filtered) {
          row.setAttribute("filtered", "");
        } else {
          row.removeAttribute("filtered");
          unfilteredRows.push(row);
        }
      });
    }
  } else {
    const rows = tableRows(table);
    const normalized = searchValue.toLowerCase();
    rows.forEach((row) => {
      var _a2, _b2;
      const rowText = (_b2 = (_a2 = row.textContent) == null ? void 0 : _a2.trim().toLowerCase()) != null ? _b2 : "";
      const filtered = normalized.length > 0 && !rowText.includes(normalized);
      row.filtered = filtered;
      if (filtered) {
        row.setAttribute("filtered", "");
      } else {
        row.removeAttribute("filtered");
        unfilteredRows.push(row);
      }
    });
    const headerCheckbox = (_d = (_c = (_b = (_a = table == null ? void 0 : table._tableHeaderRow) == null ? void 0 : _a.shadowRoot) == null ? void 0 : _b.querySelector(`${CARBON_PREFIX}-checkbox`)) == null ? void 0 : _c.shadowRoot) == null ? void 0 : _d.querySelector(`.${CARBON_PREFIX}--checkbox`);
    if (headerCheckbox) {
      headerCheckbox.disabled = unfilteredRows.length === 0;
    }
  }
  const searchPayload = buildPayload({ detail: { value: searchValue } }, table);
  hook.pushEventTo(table, "graphene:table-search-input", searchPayload);
  const filterPayload = buildPayload({ detail: { unfilteredRows } }, table);
  hook.pushEventTo(table, "graphene:table-filtered", filterPayload);
};
var handleSimulation = (hook, detail) => {
  if (!detail || typeof detail.action !== "string")
    return;
  const table = hook.el;
  const rows = tableRows(table);
  const currentSelectedIds = rowIds(
    rows.filter((row) => row.hasAttribute("selected") || row.selected)
  );
  switch (detail.action) {
    case "select_row": {
      const rowIdValue = detail.row_id ? String(detail.row_id) : null;
      if (!rowIdValue)
        return;
      const selectedSet = new Set(currentSelectedIds);
      const shouldSelect = typeof detail.selected === "boolean" ? detail.selected : !selectedSet.has(rowIdValue);
      if (shouldSelect) {
        selectedSet.add(rowIdValue);
      } else {
        selectedSet.delete(rowIdValue);
      }
      applySelection(hook, selectedSet, rowIdValue, "graphene:table-row-selected");
      break;
    }
    case "select_all": {
      const selectableRows = rows.filter(
        (row) => !row.hasAttribute("filtered") && !row.hasAttribute("disabled")
      );
      const selectableIds = rowIds(selectableRows);
      const selectedSet = new Set(currentSelectedIds);
      const shouldSelect = typeof detail.selected === "boolean" ? detail.selected : selectedSet.size < selectableIds.length;
      const nextSet = shouldSelect ? new Set(selectableIds) : /* @__PURE__ */ new Set();
      applySelection(hook, nextSet, null, "graphene:table-row-all-selected");
      break;
    }
    case "select_none": {
      applySelection(hook, /* @__PURE__ */ new Set(), null, "graphene:table-row-all-selected");
      break;
    }
    case "sort": {
      const columnIndex = Number(detail.column_index);
      if (Number.isNaN(columnIndex))
        return;
      const direction = detail.direction === "descending" ? "descending" : "ascending";
      applySort(hook, columnIndex, direction);
      break;
    }
    case "search": {
      const value = detail.value ? String(detail.value) : "";
      applySearch(hook, value);
      break;
    }
    default:
      break;
  }
};
var syncSelection = async (hook) => {
  const root = hook.el;
  await Promise.all([
    customElements.whenDefined("cds-table"),
    customElements.whenDefined("cds-table-row"),
    customElements.whenDefined("cds-table-header-row")
  ]);
  const table = root;
  if (table == null ? void 0 : table.updateComplete) {
    await table.updateComplete;
  }
  const rows = Array.from(root.querySelectorAll("cds-table-row"));
  if (!rows.length)
    return;
  await Promise.all(
    rows.map((row) => row.updateComplete).filter((value) => value && typeof value.then === "function")
  );
  const desiredRows = rows.filter((row) => row.hasAttribute("selected"));
  rows.forEach((row) => {
    const desired = row.hasAttribute("selected");
    if (row.selected !== desired) {
      row.selected = desired;
    }
  });
  const currentRows = Array.isArray(table._selectedRows) ? table._selectedRows : [];
  const desiredSet = new Set(desiredRows);
  const currentSet = new Set(currentRows);
  let changed = false;
  desiredRows.forEach((row) => {
    if (!currentSet.has(row))
      changed = true;
  });
  currentRows.forEach((row) => {
    if (!desiredSet.has(row))
      changed = true;
  });
  if (changed) {
    table._selectedRows = [...desiredRows];
    updateTableSelectionUI(table, desiredRows.length);
  }
};
var syncSelectionWithSignature = (hook) => {
  const root = hook.el;
  const appliedFromDataset = applySelectedIdsFromDataset(root);
  const signature = selectionSignature(root);
  if (!appliedFromDataset && hook._basicComponentsTableSelectionSignature === signature)
    return;
  hook._basicComponentsTableSelectionSignature = signature;
  void syncSelection(hook);
};
var BasicComponentsTable = {
  mounted() {
    const handlers = {};
    Object.entries(TABLE_EVENTS).forEach(([eventName, pushEventName]) => {
      const handler = (event) => {
        this.pushEventTo(this.el, pushEventName, buildPayload(event, this.el));
      };
      handlers[eventName] = handler;
      this.el.addEventListener(eventName, handler);
    });
    this._basicComponentsTableHandlers = handlers;
    const simulatorHandler = (event) => {
      handleSimulation(this, event.detail || {});
    };
    this.el.addEventListener("graphene:table-simulate", simulatorHandler);
    this._basicComponentsTableSimulatorHandler = simulatorHandler;
    ensureSearchValue(this.el);
    ensureFilterRows(this.el);
    syncSelectionWithSignature(this);
  },
  updated() {
    ensureSearchValue(this.el);
    ensureFilterRows(this.el);
    syncSelectionWithSignature(this);
  },
  destroyed() {
    const handlers = this._basicComponentsTableHandlers || {};
    Object.entries(handlers).forEach(([eventName, handler]) => {
      this.el.removeEventListener(eventName, handler);
    });
    this._basicComponentsTableHandlers = {};
    if (this._basicComponentsTableSimulatorHandler) {
      this.el.removeEventListener(
        "graphene:table-simulate",
        this._basicComponentsTableSimulatorHandler
      );
    }
    this._basicComponentsTableSimulatorHandler = null;
  }
};

// src/lib/_dynamic_loader_mapping.ts
var componentImports = {
  "cds-accordion": () => import("./chunks/accordion-IMZIHS6Z.js"),
  "cds-accordion-item": () => import("./chunks/accordion-IMZIHS6Z.js"),
  "cds-accordion-skeleton": () => import("./chunks/accordion-IMZIHS6Z.js"),
  "cds-actionable-notification": () => import("./chunks/notification-PKBHWCT5.js"),
  "cds-actionable-notification-button": () => import("./chunks/notification-PKBHWCT5.js"),
  "cds-ai-label": () => import("./chunks/ai-label-XPCUZFA3.js"),
  "cds-ai-label-action-button": () => import("./chunks/ai-label-XPCUZFA3.js"),
  "cds-ai-skeleton-icon": () => import("./chunks/ai-skeleton-7COAKCN7.js"),
  "cds-ai-skeleton-placeholder": () => import("./chunks/ai-skeleton-7COAKCN7.js"),
  "cds-ai-skeleton-text": () => import("./chunks/ai-skeleton-7COAKCN7.js"),
  "cds-badge-indicator": () => import("./chunks/badge-indicator-SXQUOZLX.js"),
  "cds-breadcrumb": () => import("./chunks/breadcrumb-4IA5MNC4.js"),
  "cds-breadcrumb-item": () => import("./chunks/breadcrumb-4IA5MNC4.js"),
  "cds-breadcrumb-link": () => import("./chunks/breadcrumb-4IA5MNC4.js"),
  "cds-breadcrumb-overflow-menu": () => import("./chunks/breadcrumb-4IA5MNC4.js"),
  "cds-breadcrumb-skeleton": () => import("./chunks/breadcrumb-4IA5MNC4.js"),
  "cds-button": () => import("./chunks/button-7XNEIG5C.js"),
  "cds-button-set": () => import("./chunks/button-7XNEIG5C.js"),
  "cds-button-set-base": () => import("./chunks/button-7XNEIG5C.js"),
  "cds-button-skeleton": () => import("./chunks/button-7XNEIG5C.js"),
  "cds-callout-notification": () => import("./chunks/notification-PKBHWCT5.js"),
  "cds-chat-button": () => import("./chunks/chat-button-5QIGCAS7.js"),
  "cds-chat-button-skeleton": () => import("./chunks/chat-button-5QIGCAS7.js"),
  "cds-checkbox": () => import("./chunks/checkbox-VFKS5FP4.js"),
  "cds-checkbox-group": () => import("./chunks/checkbox-VFKS5FP4.js"),
  "cds-checkbox-skeleton": () => import("./chunks/checkbox-VFKS5FP4.js"),
  "cds-clickable-tile": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-code-snippet": () => import("./chunks/code-snippet-RRCQDAQ3.js"),
  "cds-code-snippet-skeleton": () => import("./chunks/code-snippet-RRCQDAQ3.js"),
  "cds-column": () => import("./chunks/grid-SNXQFTF5.js"),
  "cds-column-hang": () => import("./chunks/grid-SNXQFTF5.js"),
  "cds-combo-box": () => import("./chunks/combo-box-X7BPBG2Q.js"),
  "cds-combo-box-item": () => import("./chunks/combo-box-X7BPBG2Q.js"),
  "cds-combo-button": () => import("./chunks/combo-button-UUPWDURW.js"),
  "cds-contained-list": () => import("./chunks/contained-list-5CM7RY4F.js"),
  "cds-contained-list-description": () => import("./chunks/contained-list-5CM7RY4F.js"),
  "cds-contained-list-item": () => import("./chunks/contained-list-5CM7RY4F.js"),
  "cds-content-switcher": () => import("./chunks/content-switcher-NSQOC3U7.js"),
  "cds-content-switcher-item": () => import("./chunks/content-switcher-NSQOC3U7.js"),
  "cds-copy": () => import("./chunks/copy-ARGEVFR6.js"),
  "cds-copy-button": () => import("./chunks/copy-button-GAUMP6LD.js"),
  "cds-date-picker": () => import("./chunks/date-picker-CL6QUVGG.js"),
  "cds-date-picker-input": () => import("./chunks/date-picker-CL6QUVGG.js"),
  "cds-date-picker-input-skeleton": () => import("./chunks/date-picker-CL6QUVGG.js"),
  "cds-definition-tooltip": () => import("./chunks/tooltip-IBOKKOU2.js"),
  "cds-dismissible-tag": () => import("./chunks/tag-W2PZ53EO.js"),
  "cds-dropdown": () => import("./chunks/dropdown-D5SARMRS.js"),
  "cds-dropdown-item": () => import("./chunks/dropdown-D5SARMRS.js"),
  "cds-dropdown-skeleton": () => import("./chunks/dropdown-D5SARMRS.js"),
  "cds-expandable-tile": () => import("./chunks/tile-BRW2DXVN.js"),
  "feature-flags": () => import("./chunks/feature-flags-QJBGKSP5.js"),
  "cds-file-uploader": () => import("./chunks/file-uploader-FIFU6E3M.js"),
  "cds-file-uploader-button": () => import("./chunks/file-uploader-FIFU6E3M.js"),
  "cds-file-uploader-drop-container": () => import("./chunks/file-uploader-FIFU6E3M.js"),
  "cds-file-uploader-item": () => import("./chunks/file-uploader-FIFU6E3M.js"),
  "cds-file-uploader-skeleton": () => import("./chunks/file-uploader-FIFU6E3M.js"),
  "cds-fluid-number-input": () => import("./chunks/fluid-number-input-2OE6YX6E.js"),
  "cds-fluid-number-input-skeleton": () => import("./chunks/fluid-number-input-2OE6YX6E.js"),
  "cds-fluid-search": () => import("./chunks/fluid-search-KYSSZ4QS.js"),
  "cds-fluid-search-skeleton": () => import("./chunks/fluid-search-KYSSZ4QS.js"),
  "cds-fluid-select": () => import("./chunks/fluid-select-CY7NWCDW.js"),
  "cds-fluid-select-skeleton": () => import("./chunks/fluid-select-CY7NWCDW.js"),
  "cds-fluid-text-input": () => import("./chunks/fluid-text-input-MHGA5XCM.js"),
  "cds-fluid-text-input-skeleton": () => import("./chunks/fluid-text-input-MHGA5XCM.js"),
  "cds-fluid-textarea": () => import("./chunks/fluid-textarea-O3DGGVYK.js"),
  "cds-fluid-textarea-skeleton": () => import("./chunks/fluid-textarea-O3DGGVYK.js"),
  "cds-form": () => import("./chunks/form-Q2R6IJEV.js"),
  "cds-form-group": () => import("./chunks/form-group-667PYRM5.js"),
  "cds-form-item": () => import("./chunks/form-Q2R6IJEV.js"),
  "cds-grid": () => import("./chunks/grid-SNXQFTF5.js"),
  "cds-header": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-global-action": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-menu": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-menu-button": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-menu-item": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-name": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-nav": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-nav-item": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-panel": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-header-side-nav-items": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-heading": () => import("./chunks/heading-OLKMZXSP.js"),
  "cds-icon": () => import("./chunks/icon-UN6LJPBJ.js"),
  "cds-icon-button": () => import("./chunks/icon-button-BTH6F5WH.js"),
  "cds-icon-indicator": () => import("./chunks/icon-indicator-4UJ6KTLJ.js"),
  "cds-inline-loading": () => import("./chunks/inline-loading-DW5V2QYP.js"),
  "cds-inline-notification": () => import("./chunks/notification-PKBHWCT5.js"),
  "cds-layer": () => import("./chunks/layer-2BT6TNIN.js"),
  "cds-link": () => import("./chunks/link-66WPYCPL.js"),
  "cds-list-item": () => import("./chunks/list-GEQUCH73.js"),
  "cds-loading": () => import("./chunks/loading-DEBOPBT6.js"),
  "cds-menu": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-menu-button": () => import("./chunks/menu-button-WUHWP4OB.js"),
  "cds-menu-item": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-menu-item-divider": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-menu-item-group": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-menu-item-radio-group": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-menu-item-selectable": () => import("./chunks/menu-VLLJHA2O.js"),
  "cds-modal": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-body": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-body-content": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-close-button": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-footer": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-footer-button": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-header": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-heading": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-modal-label": () => import("./chunks/modal-AY2PM4NW.js"),
  "cds-multi-select": () => import("./chunks/multi-select-WNVAISZO.js"),
  "cds-multi-select-item": () => import("./chunks/multi-select-WNVAISZO.js"),
  "cds-number-input": () => import("./chunks/number-input-VYSJABKW.js"),
  "cds-number-input-skeleton": () => import("./chunks/number-input-VYSJABKW.js"),
  "cds-operational-tag": () => import("./chunks/tag-W2PZ53EO.js"),
  "cds-ordered-list": () => import("./chunks/list-GEQUCH73.js"),
  "cds-overflow-menu": () => import("./chunks/overflow-menu-VAYFP2LG.js"),
  "cds-overflow-menu-body": () => import("./chunks/overflow-menu-VAYFP2LG.js"),
  "cds-overflow-menu-item": () => import("./chunks/overflow-menu-VAYFP2LG.js"),
  "cds-page-header": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-page-header-breadcrumb": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-page-header-content": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-page-header-content-text": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-page-header-hero-image": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-page-header-tabs": () => import("./chunks/page-header-AFG4YDVS.js"),
  "cds-pagination": () => import("./chunks/pagination-ECS252CA.js"),
  "cds-password-input": () => import("./chunks/password-input-YNY43I3V.js"),
  "cds-password-input-skeleton": () => import("./chunks/password-input-YNY43I3V.js"),
  "cds-popover": () => import("./chunks/popover-3IIYF43C.js"),
  "cds-popover-content": () => import("./chunks/popover-3IIYF43C.js"),
  "cds-progress-bar": () => import("./chunks/progress-bar-GLV3ETHV.js"),
  "cds-progress-indicator": () => import("./chunks/progress-indicator-TOJXEYBJ.js"),
  "cds-progress-indicator-skeleton": () => import("./chunks/progress-indicator-TOJXEYBJ.js"),
  "cds-progress-step": () => import("./chunks/progress-indicator-TOJXEYBJ.js"),
  "cds-progress-step-skeleton": () => import("./chunks/progress-indicator-TOJXEYBJ.js"),
  "cds-radio-button": () => import("./chunks/radio-button-OXUQJ5JQ.js"),
  "cds-radio-button-group": () => import("./chunks/radio-button-OXUQJ5JQ.js"),
  "cds-radio-button-skeleton": () => import("./chunks/radio-button-OXUQJ5JQ.js"),
  "cds-radio-tile": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-search": () => import("./chunks/search-2D7UNLRI.js"),
  "cds-select": () => import("./chunks/select-FR5UJA6J.js"),
  "cds-select-item": () => import("./chunks/select-FR5UJA6J.js"),
  "cds-select-item-group": () => import("./chunks/select-FR5UJA6J.js"),
  "cds-select-skeleton": () => import("./chunks/select-FR5UJA6J.js"),
  "cds-selectable-tag": () => import("./chunks/tag-W2PZ53EO.js"),
  "cds-selectable-tile": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-shape-indicator": () => import("./chunks/shape-indicator-6NMCHP7Z.js"),
  "cds-side-nav": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-nav-divider": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-nav-items": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-nav-link": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-nav-menu": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-nav-menu-item": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-side-panel": () => import("./chunks/side-panel-JWASRHP7.js"),
  "cds-skeleton-icon": () => import("./chunks/skeleton-icon-6ZMPAYT5.js"),
  "cds-skeleton-placeholder": () => import("./chunks/skeleton-placeholder-QAQR6TCE.js"),
  "cds-skeleton-text": () => import("./chunks/skeleton-text-7TRGKCPX.js"),
  "cds-skip-to-content": () => import("./chunks/skip-to-content-5GMAMOFE.js"),
  "cds-slider": () => import("./chunks/slider-LF7GFV5R.js"),
  "cds-slider-input": () => import("./chunks/slider-LF7GFV5R.js"),
  "cds-slider-skeleton": () => import("./chunks/slider-LF7GFV5R.js"),
  "cds-slug": () => import("./chunks/slug-Q2NAHL3A.js"),
  "cds-slug-action-button": () => import("./chunks/slug-Q2NAHL3A.js"),
  "cds-stack": () => import("./chunks/stack-XYH44LT6.js"),
  "cds-structured-list": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-body": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-cell": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-head": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-header-cell": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-header-cell-skeleton": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-header-row": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-structured-list-row": () => import("./chunks/structured-list-ZGISZM3V.js"),
  "cds-switcher": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-switcher-divider": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-switcher-item": () => import("./chunks/ui-shell-L7O2FYPL.js"),
  "cds-tab": () => import("./chunks/tabs-44725J7C.js"),
  "cds-tab-skeleton": () => import("./chunks/tabs-44725J7C.js"),
  "cds-table": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-batch-actions": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-body": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-cell": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-cell-content": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-expanded-row": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-head": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-header-cell": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-header-description": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-header-row": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-header-title": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-row": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-skeleton": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-toolbar": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-toolbar-content": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-table-toolbar-search": () => import("./chunks/data-table-7J7PXOXJ.js"),
  "cds-tabs": () => import("./chunks/tabs-44725J7C.js"),
  "cds-tabs-skeleton": () => import("./chunks/tabs-44725J7C.js"),
  "cds-tag": () => import("./chunks/tag-W2PZ53EO.js"),
  "cds-tag-skeleton": () => import("./chunks/tag-W2PZ53EO.js"),
  "cds-tearsheet": () => import("./chunks/tearsheet-SL5PBBWW.js"),
  "cds-text-input": () => import("./chunks/text-input-RE6LEY4Z.js"),
  "cds-text-input-skeleton": () => import("./chunks/text-input-RE6LEY4Z.js"),
  "cds-textarea": () => import("./chunks/textarea-A3R5DU5L.js"),
  "cds-textarea-skeleton": () => import("./chunks/textarea-A3R5DU5L.js"),
  "cds-tile": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-tile-above-the-fold-content": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-tile-below-the-fold-content": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-tile-group": () => import("./chunks/tile-BRW2DXVN.js"),
  "cds-time-picker": () => import("./chunks/time-picker-PNTI63MR.js"),
  "cds-time-picker-select": () => import("./chunks/time-picker-PNTI63MR.js"),
  "cds-toast-notification": () => import("./chunks/notification-PKBHWCT5.js"),
  "cds-toggle": () => import("./chunks/toggle-XHPFTKHU.js"),
  "cds-toggle-skeleton": () => import("./chunks/toggle-XHPFTKHU.js"),
  "cds-toggletip": () => import("./chunks/toggle-tip-6SYBUWR2.js"),
  "cds-tooltip": () => import("./chunks/tooltip-IBOKKOU2.js"),
  "cds-tooltip-content": () => import("./chunks/tooltip-IBOKKOU2.js"),
  "cds-tree-node": () => import("./chunks/tree-view-A3O6QGMU.js"),
  "cds-tree-view": () => import("./chunks/tree-view-A3O6QGMU.js"),
  "cds-unordered-list": () => import("./chunks/list-GEQUCH73.js")
};

// src/lib/dynamic_loader.ts
var componentNames = Object.keys(componentImports);
var componentSelector = componentNames.join(",");
var componentSet = new Set(componentNames);
var loadedComponents = {};
var numberInputTags = /* @__PURE__ */ new Set(["cds-number-input", "cds-fluid-number-input"]);
var patchedNumberInputs = /* @__PURE__ */ new Set();
var definePatchFlag = "__graphenePatchedDefine";
var originalDefine = customElements.define.bind(customElements);
function isComponentTag(tagName) {
  return componentSet.has(tagName.toLowerCase());
}
function importerForTag(tagName) {
  return componentImports[tagName.toLowerCase()];
}
function loadComponentByTag(tagName) {
  const componentName = tagName.toLowerCase();
  if (!loadedComponents[componentName]) {
    const importer = importerForTag(componentName);
    if (!importer) {
      console.warn(`No importer found for component: ${componentName}`);
      return void 0;
    }
    loadedComponents[componentName] = importer().then((module) => module).catch((err) => {
      console.error(`Error loading ${componentName}:`, err);
      delete loadedComponents[componentName];
      throw err;
    });
  }
  return loadedComponents[componentName];
}
function normalizeNumberInputStep(el) {
  const tagName = el.tagName.toLowerCase();
  if (!numberInputTags.has(tagName)) {
    return;
  }
  const step = el.getAttribute("step");
  const safeStep = step === null || step === "" || step === "null" || step === "undefined" ? "1" : step;
  el.setAttribute("step", safeStep);
  const applyStep = () => {
    el._step = safeStep;
    el.step = safeStep;
  };
  if (customElements.get(tagName)) {
    applyStep();
  } else {
    customElements.whenDefined(tagName).then(applyStep);
  }
}
function applyNumberInputDescriptor(proto) {
  var _a, _b;
  const descriptor = Object.getOwnPropertyDescriptor(proto, "step");
  if (!descriptor) {
    return;
  }
  const originalGet = descriptor.get;
  const originalSet = descriptor.set;
  Object.defineProperty(proto, "step", {
    configurable: (_a = descriptor.configurable) != null ? _a : true,
    enumerable: (_b = descriptor.enumerable) != null ? _b : true,
    get() {
      const value = this._step;
      if (value === null || value === void 0) {
        return "1";
      }
      return originalGet ? originalGet.call(this) : String(value);
    },
    set(value) {
      const safeValue = value === null || value === void 0 || value === "" ? "1" : value;
      if (originalSet) {
        originalSet.call(this, safeValue);
      } else {
        this._step = safeValue;
      }
    }
  });
  if (!proto.__grapheneStepPatched) {
    const originalConnected = proto.connectedCallback;
    proto.connectedCallback = function(...args) {
      var _a2;
      if (this._step === null || this._step === void 0) {
        const step = ((_a2 = this.getAttribute) == null ? void 0 : _a2.call(this, "step")) || "1";
        this._step = step;
        try {
          this.step = step;
        } catch (_error) {
        }
      }
      return originalConnected ? originalConnected.apply(this, args) : void 0;
    };
    proto.__grapheneStepPatched = true;
  }
}
function patchNumberInputPrototype(tagName) {
  if (!numberInputTags.has(tagName) || patchedNumberInputs.has(tagName)) {
    return;
  }
  const ctor = customElements.get(tagName);
  if (!(ctor == null ? void 0 : ctor.prototype)) {
    return;
  }
  applyNumberInputDescriptor(ctor.prototype);
  patchedNumberInputs.add(tagName);
}
function ensureNumberInputPatched(tagName) {
  if (!numberInputTags.has(tagName) || patchedNumberInputs.has(tagName)) {
    return;
  }
  customElements.whenDefined(tagName).then(() => {
    patchNumberInputPrototype(tagName);
  });
}
function ensureDefinePatched() {
  const registry = customElements;
  if (registry[definePatchFlag]) {
    return;
  }
  registry[definePatchFlag] = true;
  customElements.define = (name, ctor, options) => {
    if (numberInputTags.has(name) && (ctor == null ? void 0 : ctor.prototype)) {
      applyNumberInputDescriptor(ctor.prototype);
      patchedNumberInputs.add(name);
    }
    return originalDefine(name, ctor, options);
  };
}
function scanAndLoad(root) {
  if (!root) {
    return;
  }
  if (root instanceof Element && isComponentTag(root.tagName)) {
    normalizeNumberInputStep(root);
    ensureNumberInputPatched(root.tagName.toLowerCase());
    loadComponentByTag(root.tagName);
  }
  if (!componentSelector || !("querySelectorAll" in root)) {
    return;
  }
  root.querySelectorAll(componentSelector).forEach((el) => {
    normalizeNumberInputStep(el);
    ensureNumberInputPatched(el.tagName.toLowerCase());
    loadComponentByTag(el.tagName);
  });
}
function collectComponentTags(root) {
  if (!root) {
    return [];
  }
  const tags = /* @__PURE__ */ new Set();
  if (root instanceof Element && isComponentTag(root.tagName)) {
    tags.add(root.tagName.toLowerCase());
  }
  if (componentSelector && "querySelectorAll" in root) {
    root.querySelectorAll(componentSelector).forEach((el) => tags.add(el.tagName.toLowerCase()));
  }
  return Array.from(tags);
}
async function waitForComponent(tagName) {
  const loadPromise = loadComponentByTag(tagName);
  if (loadPromise) {
    await loadPromise;
  }
  await customElements.whenDefined(tagName);
}
var WebComponentManager = class {
  constructor(options = {}) {
    this.observer = null;
    this.readyPromise = null;
    this.options = options;
  }
  connect() {
    const doConnect = () => {
      var _a;
      if (this.options.hideUntilReady) {
        this.applyLoadingClass();
        const ready = this.whenReady();
        const timeoutMs = (_a = this.options.readyTimeoutMs) != null ? _a : 0;
        if (timeoutMs > 0) {
          Promise.race([
            ready,
            new Promise((resolve) => setTimeout(resolve, timeoutMs))
          ]).finally(() => this.clearLoadingClass());
        } else {
          ready.finally(() => this.clearLoadingClass());
        }
      }
      ensureDefinePatched();
      ensureNumberInputPatched("cds-number-input");
      ensureNumberInputPatched("cds-fluid-number-input");
      this.loadExistingComponents();
      this.observeDOM();
    };
    if (["complete", "interactive"].includes(document.readyState)) {
      doConnect();
    } else {
      document.addEventListener("DOMContentLoaded", doConnect);
    }
  }
  disconnect() {
    var _a;
    (_a = this.observer) == null ? void 0 : _a.disconnect();
    this.observer = null;
  }
  whenReady(root = ((_a) => (_a = this.options.root) != null ? _a : document.body)()) {
    if (this.readyPromise) {
      return this.readyPromise;
    }
    this.loadExistingComponents();
    const tags = collectComponentTags(root != null ? root : document.documentElement);
    this.readyPromise = Promise.all(tags.map((tag) => waitForComponent(tag))).then(
      () => void 0
    );
    return this.readyPromise;
  }
  loadExistingComponents() {
    var _a;
    scanAndLoad((_a = document.body) != null ? _a : document);
  }
  observeDOM() {
    var _a;
    const observerCallback = (mutationsList) => {
      for (const mutation of mutationsList) {
        if (mutation.type !== "childList") {
          continue;
        }
        mutation.addedNodes.forEach((node) => {
          if (node instanceof Element || node instanceof DocumentFragment) {
            scanAndLoad(node);
          }
        });
      }
    };
    const observerOptions = { childList: true, subtree: true };
    const root = (_a = document.body) != null ? _a : document.documentElement;
    if (!root) {
      return;
    }
    this.observer = new MutationObserver(observerCallback);
    this.observer.observe(root, observerOptions);
  }
  applyLoadingClass() {
    var _a, _b;
    const className = (_a = this.options.loadingClass) != null ? _a : "graphene-loading";
    (_b = document.documentElement) == null ? void 0 : _b.classList.add(className);
  }
  clearLoadingClass() {
    var _a, _b;
    const className = (_a = this.options.loadingClass) != null ? _a : "graphene-loading";
    (_b = document.documentElement) == null ? void 0 : _b.classList.remove(className);
  }
};
ensureDefinePatched();
ensureNumberInputPatched("cds-number-input");
ensureNumberInputPatched("cds-fluid-number-input");

// src/lib/socket_utils.ts
function mergeWebComponentsAttrs(from, to) {
  if (from.tagName.startsWith("cds-")) {
    const attributes = [...Array.from(to.attributes), ...Array.from(from.attributes)];
    attributes.forEach((attr) => {
      to.setAttribute(attr.name, attr.value);
    });
    const tagName = to.tagName.toLowerCase();
    if (tagName === "cds-number-input" || tagName === "cds-fluid-number-input") {
      const step = to.getAttribute("step");
      const safeStep = step === null || step === "" || step === "null" || step === "undefined" ? "1" : step;
      to.setAttribute("step", safeStep);
      to._step = safeStep;
      to.step = safeStep;
    }
  }
}
export {
  hooks_exports as Hooks,
  WebComponentManager,
  mergeWebComponentsAttrs
};
