# TODO

## Codegen refactor (metadata-first, all Elixir)
- [x] Add a metadata extractor Mix task (e.g. `mix graphene.codegen.extract`) that reads `assets/node_modules/@carbon/web-components/custom-elements.json` and emits a normalized metadata file (e.g. `assets/codegen/carbon_metadata.json`).
- [x] Parse Carbon type enums/unions from `assets/node_modules/@carbon/web-components/es/**/defs.d.ts` in Elixir and include them in the metadata file.
- [x] Update `mix graphene.core_components.generate` to read only the metadata file (no direct reads from node_modules).
- [x] Update `mix graphene.carbon_components.generate` to read only the metadata file (no CoreComponents doc dependency).
- [x] Update `assets/eex/dynamic_loader_mapping.ts` generation to read only the metadata file.
- [ ] Move patch rules to a data-driven config (e.g. `assets/codegen/overrides.yml`) and keep `Graphene.CodeGen.ComponentPatches` as a generic applier.
- [ ] Auto-generate `Graphene.CodeGen.Component.AttrType` from metadata enum/type info; keep a small fallback for unknowns.
- [ ] Add an allowlist mechanism in metadata to optionally slice components (keep full coverage as default).
- [ ] Add a codegen audit task (e.g. `mix graphene.codegen.audit`) to validate metadata completeness and patch references.

## Public API facade (Carbon-first)
- [x] Add `Graphene.Components` module with `__using__/1` to import/alias CarbonComponents in one line.
- [ ] Ensure `Graphene.Components` is the only public entry point in README/docs/examples.
- [x] Mark `Graphene.Internal.CoreComponents` and `Graphene.Internal.FormComponents` as internal (`@moduledoc false`, hidden from ExDoc).
- [x] Add a minimal `Graphene` facade (optional) that delegates to `Graphene.Components`.

## Docs and discoverability
- [ ] Create a canonical Phoenix/LiveView setup guide (npm deps, fonts, CSS import order, Tailwind notes, minimal layout).
- [ ] Add a Storybook-driven API reference generator that extracts attrs/slots/examples into a searchable doc.
- [ ] Wire the docs generator into a mix task (e.g. `mix graphene.docs.generate`).
- [ ] Update storybook landing page to link to the new guide and API reference.

## LiveView-friendly ergonomics
- [ ] Add optional helper components for common LiveView patterns (cards, lists, filter panels, layout grids).
- [ ] Add defaults or helpers to reduce slot nesting where practical (via Carbon recipes/templates).
- [ ] Document recommended LiveView patterns alongside Storybook examples.

## Validation & error messages
- [ ] Add compile-time validations for required attrs/slots in generated CarbonComponents.
- [ ] Improve error messages for common misuses (missing `:id`, missing `:name`, invalid slot names).
- [ ] Add tests for validation error messages (ExUnit).

## Styling presets
- [ ] Add an optional Carbon layout preset CSS file to reduce bespoke setup.
- [ ] Document how to opt-in and integrate the preset with Tailwind and Graphene assets.

## Maintenance & QA
- [ ] Add a developer checklist for Carbon upgrades (extract metadata, regenerate, run audits, update docs).
- [ ] Add a minimal regression test to ensure metadata extraction matches component counts.
