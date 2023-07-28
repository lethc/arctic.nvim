-- Template: https://github.com/rktjmp/lush-template/blob/main/lua/lush_theme/lush_template.lua
-- VSCode Theme Color Reference: https://code.visualstudio.com/api/references/theme-color#command-center-colors

local lush = require('lush')

local norm_fg = '#D4D4D4'
local norm_bg = '#1E1E1E'

local blue = '#569CD6'
local blue2 = '#4fc1ff'
local light_blue = '#9CDCFE'
local bright_blue = '#2aaaff'
local green = '#6A9955'
local blue_green = '#4EC9B0'
local light_green = '#B5CEA8'
local light_red = '#D16969'
local orange = '#CE9178'
local yellow_orange = '#D7BA7D'
local yellow = '#DCDCAA'
local pink = '#C586C0'

local white = '#ffffff'
local gray = '#51504f'
local gray2 = '#858585'
local gray3 = '#808080'
local black = '#2d2d2d' -- TabLine
local black2 = '#252526' -- Statusline, TabLineFill, Pmenu
local black3 = '#2a2d2e' -- CursorLine (list.hoverBackground from VSCode)

local error_red = '#F14C4C'
local warn_yellow = '#CCA700'
local info_blue = '#3794ff'
local hint_gray = '#B0B0B0'
local ok_green = '#89d185' -- color for success, so I use notebookStatusSuccessIcon.foreground

local selection_blue = '#04395e'
local folded_blue = '#202d39' -- editor.foldBackground
local float_border_fg = '#454545'
local indent_guide_fg = '#404040'
local indent_guide_context_fg = '#707070'
local label_fg = '#c8c8c8'

---@diagnostic disable
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {

    --
    -- Preset
    --
    TabBorder { fg = black2 }, -- tab.border, border to separate tabs from each other
    FloatBorder { fg = float_border_fg },
    SelectionHighlightBackground { bg = '#333a40' },
    LightBulb { fg = '#ffcc00' },
    CodeLens { fg = '#999999' },
    GutterGitModified { fg = '#1b81a8' },
    GutterGitAdded { fg = '#487e02' },
    GutterGitDeleted { fg = '#f14c4c' },
    Breadcrumb { fg = '#a9a9a9', bg = norm_bg },
    ScrollbarSlider { bg = '#424242' },
    PeekViewBorder { fg = '#3794ff' },
    PeekViewNormal { bg = '#001f33' },
    PeekViewCursorLine { bg = '#002f4e' },
    PeekViewMatchHighlight { bg ='#996214' }, -- peekViewEditor.matchHighlightBackground
    GhostText { fg = '#6b6b6b' },
    Icon { fg = '#c5c5c5' },
    Description { fg = '#989898' }, -- descriptionForeground
    ProgressBar { fg = '#0e70c0' }, -- progressBar.background
    MatchedCharacters { fg = bright_blue }, -- editorSuggestWidget.highlightForeground
    Hint { MatchedCharacters }, -- for the hint letter in options, e.g., the q in [q]uickfix
    -- For the unused code, use Identifier's fg (9cdcfe) as the base color,
    -- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
    -- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
    UnnecessaryCode { fg = '#729db4' },
    -- Git diff
    DiffTextAdded { bg = '#386229' },
    DiffTextDeleted { bg = '#781212' },
    DiffTextChanged { bg = '#0000ff' },
    DiffLineAdded { bg = '#373d29' },
    DiffLineDeleted { bg = '#4b1818' },
    DiffLineChanged { bg = '#0e2f44' },
    -- Quickfix list (can be used to define qf syntax, e.g.,
    -- ~/.config/nvim/syntax/qf.vim)
    QfFileName { fg = white },
    QfSelection { bg = '#3a3d41' }, -- terminal.inactiveSelectionBackground
    QfText { fg = '#bbbbbb' }, -- normal text in quickfix list

    --
    -- Editor
    --
    CursorLine { bg = black3 },
    CursorColumn { bg = black3 },
    ColorColumn { bg = black2 }, -- #5a5a5a in VSCode (editorRuler.foreground) it's too bright
    Conceal { fg = gray2 },
    Cursor { fg = gray, bg = '#aeafad' },
    -- lCursor { },
    -- CursorIM { },
    Directory { fg = blue },
    DiffAdd { DiffLineAdded },
    DiffDelete { DiffLineDeleted },
    DiffChange { DiffLineChanged },
    DiffText { DiffTextChanged },
    EndOfBuffer { fg = norm_bg },
    -- TermCursor { },
    -- TermCursorNC { },
    ErrorMsg { fg = error_red },
    WinSeparator { fg = '#444444' }, -- editorGroup.border
    VirtSplit { WinSeparator }, -- deprecated and use WinSeparator instead
    LineNr { fg = gray2 },
    CursorLineNr { fg = '#c6c6c6' },
    Folded { bg = folded_blue },
    CursorLineFold { CursorLineNr },
    FoldColumn { LineNr }, -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
    SignColumn { bg = norm_bg },
    IncSearch { bg = '#515c6a' },
    -- Substitute { },
    MatchParen { bg = gray, gui = 'bold, underline' },
    ModeMsg { fg = norm_fg },
    MsgArea { fg = norm_fg },
    -- MsgSeparator { },
    MoreMsg { fg = norm_fg },
    NonText { fg = gray2 },
    Normal { fg = norm_fg, bg = norm_bg },
    -- NormalNC { },
    Pmenu { fg = norm_fg, bg = black2 },
    PmenuSel { fg = white, bg = selection_blue },
    PmenuSbar { bg = black2 },
    PmenuThumb { bg = '#474747' },
    NormalFloat { Pmenu },
    Question { fg = blue },
    QuickFixLine { QfSelection },
    Search { bg = '#613214' },
    SpecialKey { NonText },
    SpellBad { gui = 'undercurl', sp = error_red },
    SpellCap { gui = 'undercurl', sp = warn_yellow},
    SpellLocal { gui = 'undercurl', sp = info_blue },
    SpellRare  { gui = 'undercurl', sp = info_blue  },
    StatusLine { bg = black2 },
    StatusLineNC { fg = gray, bg = black2 },
    TabLine { fg = '#8f8f8f', bg = black },
    TabLineFill { fg = 'NONE', bg = black2 },
    TabLineSel { fg = white, bg = norm_bg },
    Title { fg = blue, gui = 'bold' },
    Visual { bg = '#264F78' },
    -- VisualNOS { },
    WarningMsg { fg = warn_yellow },
    Whitespace { fg = '#3e3e3d' },
    WildMenu { PmenuSel },
    Winbar { Breadcrumb },
    WinbarNC { Breadcrumb },

    --
    -- Syntax
    --
    Comment { fg = green, gui = 'italic, bold' },

    Constant { fg = blue },
    String { fg = orange },
    Character { Constant },
    Number { fg = light_green },
    Boolean { Constant },
    Float { Number },

    Identifier { fg = light_blue  },
    Function { fg = yellow, gui = 'bold, italic' },

    Statement { fg = pink },
    Conditional { Statement },
    Repeat { Statement },
    Label { Statement },
    Operator { fg = norm_fg },
    Keyword { fg = blue, gui = 'bold, italic' },
    Exception { Statement },

    PreProc { fg = pink },
    Include { PreProc },
    Define { PreProc },
    Macro { PreProc },
    PreCondit { PreProc },

    Type { fg = blue, gui = 'bold' },
    StorageClass { Type },
    Structure { Type },
    Typedef { Type },

    Special { fg = yellow_orange },
    SpecialChar { Special },
    Tag { Special },
    Delimiter { Special },
    SpecialComment { Special },
    Debug { Special },

    Underlined { gui = "underline" },
    -- Ignore { },
    Error { fg = error_red },
    Todo { fg = norm_bg, bg = yellow_orange, gui = 'bold' },

    --
    -- LSP
    --
    LspReferenceText { SelectionHighlightBackground },
    LspReferenceRead { SelectionHighlightBackground },
    LspReferenceWrite { SelectionHighlightBackground },
    LspCodeLens { CodeLens },
    -- LspCodeLensSeparator { }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { MatchedCharacters },

    --
    -- Diagnostics
    --
    DiagnosticError { fg = error_red },
    DiagnosticWarn { fg = warn_yellow },
    DiagnosticInfo { fg = info_blue },
    DiagnosticHint { fg = hint_gray },
    DiagnosticOk { fg = ok_green },
    DiagnosticVirtualTextError { DiagnosticError, bg = '#332323' },
    DiagnosticVirtualTextWarn { DiagnosticWarn, bg = '#2f2c1b' },
    DiagnosticVirtualTextInfo { DiagnosticInfo, bg = '#212a35' },
    DiagnosticVirtualTextHint { DiagnosticHint, bg = black },
    DiagnosticVirtualTextOk { DiagnosticOk, bg = '#233323' },
    DiagnosticUnderlineError { gui = 'undercurl', sp = error_red },
    DiagnosticUnderlineWarn { gui = 'undercurl', sp = warn_yellow },
    DiagnosticUnderlineInfo { gui = 'undercurl', sp = info_blue },
    DiagnosticUnderlineHint { gui = 'undercurl', sp = hint_gray },
    DiagnosticUnderlineOk { gui = 'undercurl', sp = ok_green },
    DiagnosticFloatingError { DiagnosticError },
    DiagnosticFloatingWarn { DiagnosticWarn },
    DiagnosticFloatingInfo { DiagnosticInfo },
    DiagnosticFloatingHint { DiagnosticHint },
    DiagnosticFloatingOk { DiagnosticOk },
    DiagnosticSignError { DiagnosticError },
    DiagnosticSignWarn { DiagnosticWarn },
    DiagnosticSignInfo { DiagnosticInfo },
    DiagnosticSignHint { DiagnosticHint },
    DiagnosticSignOk { DiagnosticOk },
    DiagnosticUnnecessary { UnnecessaryCode, gui = 'underdashed' },
    DiagnosticDeprecated { fg = gray3, gui = 'strikethrough' },

    --
    -- Treesitter
    --
    -- The obsolete TS* highlight groups are removed since this commit
    -- https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f
    -- Now use the capture names directly as the highlight groups.
    -- (1). How to define the highlight group, see https://github.com/rktjmp/lush.nvim/issues/109
    -- (2). To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

    -- Misc
    sym("@comment") { Comment },
    sym("@comment.documentation") { sym("@comment") },
    sym("@error") { fg = error_red },
    -- sym("@none") { },
    -- sym("@preproc") { },
    -- sym("@define") { },
    sym("@operator") { fg = norm_fg },

    -- Punctuation
    sym("@punctuation.delimiter") { fg = norm_fg },
    sym("@punctuation.bracket") { fg = norm_fg },
    sym("@punctuation.special") { fg = blue },

    -- Literals
    -- sym("@string") { },
    sym("@string.documentation") { fg = orange },
    sym("@string.regex") { fg = light_red },
    sym("@string.escape") { fg = yellow_orange },
    -- sym("@string.special") { },
    -- sym("@character") { },
    -- sym("@character.special") { },
    -- sym("@boolean") { },
    -- sym("@number") { },
    -- sym("@float") { },

    -- Function
    -- sym("@function") { },
    sym("@function.builtin") { Function },
    sym("@function.call") { Function },
    sym("@function.macro") { Function },
    -- sym("@method") { },
    -- sym("@method.call") { },
    sym("@constructor") { fg = blue_green },
    sym("@parameter") { fg = light_blue },

    -- Keyword
    sym("@keyword") { Keyword },
    sym("@keyword.coroutine") { fg = pink },
    sym("@keyword.function") { fg = blue, gui = 'bold, italic' },
    sym("@keyword.operator") { fg = norm_fg },
    sym("@keyword.return") { fg = pink, gui = 'bold, italic' },
    -- sym("@conditional") { },
    -- sym("@conditional.ternary") { },
    -- sym("@repeat") { },
    -- sym("@debug") { },
    sym("@label") { fg = label_fg },
    -- sym("@include") { },
    -- sym("@exception") { },

    -- Types
    sym("@type") { fg = blue_green },
    sym("@type.builtin") { fg = blue },
    sym("@type.definition") { fg = blue_green },
    sym("@type.qualifier") { fg = blue },
    sym("@storageclass") { fg = blue },
    sym("@attribute") { fg = blue_green },
    sym("@field") { fg = light_blue },
    sym("@property") { sym("@field") },

    -- Identifiers
    sym("@variable") { fg = light_blue },
    sym("@variable.builtin") { fg = blue },
    sym("@constant") { fg = light_blue, gui = 'bold, italic' },
    sym("@constant.builtin") { Constant },
    sym("@constant.macro") { Constant },
    sym("@namespace") { fg = blue_green },
    -- sym("@symbol") { },

    -- Text (Mainly for markup languages)
    sym("@text") { fg = norm_fg },
    sym("@text.strong") { fg = norm_fg, gui = 'bold' },
    sym("@text.emphasis") { fg = norm_fg, gui = 'italic' },
    sym("@text.underline") { fg = norm_fg, gui = 'underline' },
    sym("@text.strike") { fg = norm_fg, gui = 'strikethrough' },
    sym("@text.title") { Title, gui = 'bold' },
    sym("@text.literal") { fg = orange },
    -- sym("@text.quote") { },
    sym("@text.uri") { Tag },
    sym("@text.math") { fg = blue_green },
    -- sym("@text.environment") { },
    -- sym("@text.environment.name") { },
    sym("@text.reference") { fg = orange },
    sym("@text.todo") { Todo },
    sym("@text.note") { fg = info_blue },
    sym("@text.warning") { fg = warn_yellow },
    sym("@text.danger") { fg = error_red },
    sym("@text.diff.add") { DiffTextAdded },
    sym("@text.diff.delete") { DiffTextDeleted },

    -- Tags
    sym("@tag") { fg = blue },
    sym("@tag.attribute") { fg = light_blue },
    sym("@tag.delimiter") { fg = gray3 },

    -- Conceal
    -- sym("@conceal") { },

    -- Spell
    -- sym("@spell") { },
    -- sym("@nospell") { },

    --
    -- LSP semantic tokens
    --
    -- The help page :h lsp-semantic-highlight
    -- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
    -- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
    sym("@lsp.type.namespace") { fg = blue_green },
    sym("@lsp.type.type") { fg = blue_green },
    sym("@lsp.type.class") { fg = blue_green },
    sym("@lsp.type.enum") { fg = blue_green },
    sym("@lsp.type.interface") { fg = blue_green },
    sym("@lsp.type.struct") { fg = blue_green },
    sym("@lsp.type.typeParameter") { fg = blue_green },
    sym("@lsp.type.parameter") { fg = light_blue },
    sym("@lsp.type.variable") { fg = light_blue },
    sym("@lsp.type.property") { fg = light_blue },
    sym("@lsp.type.enumMember") { fg = blue2 },
    -- sym("@lsp.type.event") { },  -- TODO: what is event property?
    sym("@lsp.type.function") { fg = yellow },
    sym("@lsp.type.method") { fg = yellow },
    sym("@lsp.type.macro") { fg = blue },
    -- sym("@lsp.type.keyword") { fg = blue },
    sym("@lsp.type.modifier") { fg = blue },
    sym("@lsp.type.comment") { fg = green },
    sym("@lsp.type.string") { fg = orange },
    sym("@lsp.type.number") { fg = light_green },
    sym("@lsp.type.regexp") { fg = light_red },
    sym("@lsp.type.operator") { fg = norm_fg },
    sym("@lsp.type.decorator") { fg = yellow },
    sym("@lsp.typemod.type.defaultLibrary") { fg = blue_green },
    sym("@lsp.typemod.class.defaultLibrary") { fg = blue_green },
    sym("@lsp.typemod.variable.defaultLibrary") { sym("@variable.builtin") },
    sym("@lsp.typemod.function.defaultLibrary") { sym("@function.builtin") },
    sym("@lsp.typemod.method.defaultLibrary") { sym("@function.builtin") },
    sym("@lsp.typemod.macro.defaultLibrary") { sym("@function.macro") },
    sym("@lsp.typemod.variable.readonly") { fg = blue2 },
    sym("@lsp.typemod.property.readonly") { fg = blue2 },
    -- Set injected highlights. Mainly for Rust doc comments and also works for
    -- other lsps that inject tokens in comments.
    -- Ref: https://github.com/folke/tokyonight.nvim/pull/340
    sym("@lsp.typemod.operator.injected") { sym("@lsp.type.operator") },
    sym("@lsp.typemod.string.injected") { sym("@lsp.type.string") },
    sym("@lsp.typemod.variable.injected") { sym("@lsp.type.variable") },

    --
    -- nvim-lspconfig
    --
    -- LspInfoTitle { },
    -- LspInfoList { },
    -- LspInfoFiletype { },
    -- LspInfoTip { },
    LspInfoBorder { FloatBorder },

    --
    -- nvim-cmp
    --
    CmpItemAbbrDeprecated { fg = gray3, bg = 'NONE', gui = 'strikethrough' },
    CmpItemAbbrMatch { MatchedCharacters, bg = 'NONE' },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
    CmpItemMenu { Description },
    CmpItemKindText { fg = '#cccccc', bg = 'NONE' },
    CmpItemKindMethod { fg = '#b180d7', bg = 'NONE' },
    CmpItemKindFunction { CmpItemKindMethod },
    CmpItemKindConstructor { CmpItemKindFunction },
    CmpItemKindField { fg = '#75beff', bg = 'NONE' },
    CmpItemKindVariable { CmpItemKindField },
    CmpItemKindClass { fg = '#ee9d28', bg = 'NONE' },
    CmpItemKindInterface { CmpItemKindField },
    CmpItemKindModule { CmpItemKindText },
    CmpItemKindProperty { CmpItemKindText },
    CmpItemKindUnit { CmpItemKindText },
    CmpItemKindValue { CmpItemKindText },
    CmpItemKindEnum { CmpItemKindClass },
    CmpItemKindKeyword { CmpItemKindText },
    CmpItemKindSnippet { CmpItemKindText },
    CmpItemKindColor { CmpItemKindText },
    CmpItemKindFile { CmpItemKindText },
    CmpItemKindReference { CmpItemKindText },
    CmpItemKindFolder { CmpItemKindText },
    CmpItemKindEnumMember { CmpItemKindField },
    CmpItemKindConstant { CmpItemKindText },
    CmpItemKindStruct { CmpItemKindText },
    CmpItemKindEvent { CmpItemKindClass },
    CmpItemKindOperator { CmpItemKindText },
    CmpItemKindTypeParameter { CmpItemKindText },
    -- Predefined for the winhighlight config of cmp float window
    SuggestWidgetBorder { FloatBorder },
    SuggestWidgetSelect { bg = selection_blue },

    --
    -- diff
    --
    -- VSCode doesn't have foreground for git added/removed/changed, so here I
    -- use the corresponding colors for gutter instead.
    diffAdded { GutterGitAdded },
    diffRemoved { GutterGitDeleted },
    diffChanged { GutterGitModified },

    --
    -- Aerial
    --
    AerialTextIcon { CmpItemKindText },
    AerialMethodIcon { CmpItemKindMethod },
    AerialFunctionIcon { CmpItemKindFunction },
    AerialConstructorIcon { CmpItemKindConstructor },
    AerialFieldIcon { CmpItemKindField },
    AerialVariableIcon { CmpItemKindVariable },
    AerialClassIcon { CmpItemKindClass },
    AerialInterfaceIcon { CmpItemKindInterface },
    AerialModuleIcon { CmpItemKindModule },
    AerialPropertyIcon { CmpItemKindProperty },
    AerialUnitIcon { CmpItemKindUnit },
    AerialValueIcon { CmpItemKindValue },
    AerialEnumIcon { CmpItemKindEnum },
    AerialKeywordIcon { CmpItemKindKeyword },
    AerialSnippetIcon { CmpItemKindSnippet },
    AerialColorIcon { CmpItemKindColor },
    AerialFileIcon { CmpItemKindFile },
    AerialReferenceIcon { CmpItemKindReference },
    AerialFolderIcon { CmpItemKindFolder },
    AerialEnumMemberIcon { CmpItemKindEnumMember },
    AerialConstantIcon { CmpItemKindConstant },
    AerialStructIcon { CmpItemKindStruct },
    AerialEventIcon { CmpItemKindEvent },
    AerialOperatorIcon { CmpItemKindOperator },
    AerialTypeParameterIcon { CmpItemKindTypeParameter },

    --
    -- Gitsigns
    --
    GitSignsAdd { GutterGitAdded },
    GitSignsChange { GutterGitModified },
    GitSignsDelete { GutterGitDeleted },
    GitSignsAddNr { GitSignsAdd },
    GitSignsChangeNr { GitSignsChange },
    GitSignsDeleteNr { GitSignsDelete },
    GitSignsAddLn { DiffAdd },
    GitSignsChangeLn { DiffChange },
    GitSignsDeleteLn { DiffDelete },
    GitSignsAddInline { DiffTextAdded },
    GitSignsChangeInline { DiffTextChanged },
    GitSignsDeleteInline { DiffTextDeleted },

    --
    -- vim-illuminate
    --
    IlluminatedWordText { SelectionHighlightBackground },
    IlluminatedWordRead { SelectionHighlightBackground },
    IlluminatedWordWrite { SelectionHighlightBackground },

    --
    -- Telescope
    --
    TelescopeBorder { FloatBorder },
    TelescopePromptBorder { TelescopeBorder },
    TelescopeResultsBorder { TelescopePromptBorder },
    TelescopePreviewBorder { TelescopePromptBorder },
    TelescopeSelection { PmenuSel },
    TelescopeSelectionCaret { TelescopeSelection },
    TelescopeMultiIcon { fg = blue_green },
    TelescopeMatching { CmpItemAbbrMatch },
    TelescopeNormal { Normal },
    TelescopePromptPrefix { Icon },

    --
    -- Harpoon
    --
    HarpoonBorder { TelescopeBorder },
    HarpoonWindow { TelescopeNormal },

    --
    -- fFHighlight
    --
    fFHintWords { gui = 'underline', sp = 'yellow' },
    fFHintCurrentWord { gui = 'undercurl', sp = 'yellow' },

    --
    -- indent-blankline
    --
    IndentBlanklineChar { fg = indent_guide_fg },
    IndentBlanklineSpaceChar { IndentBlanklineChar },
    IndentBlanklineSpaceCharBlankline { IndentBlanklineChar },
    IndentBlanklineContextChar { fg = indent_guide_context_fg },
    IndentBlanklineContextSpaceChar { IndentBlanklineContextChar },
    IndentBlanklineContextStart { gui = 'underline', sp = indent_guide_context_fg },

    --
    -- hlslens
    --
    HlSearchNear { IncSearch },
    HlSearchLens { Description },
    HlSearchLensNear { HlSearchLens },

    --
    -- nvim-ufo
    --
    UfoPreviewBorder { PeekViewBorder },
    UfoPreviewNormal { PeekViewNormal },
    UfoPreviewCursorLine { PeekViewCursorLine },
    UfoFoldedFg { fg = norm_fg },
    UfoFoldedBg { bg = folded_blue },
    UfoCursorFoldedLine { bg = '#2F3C48', gui = 'bold, italic' },
    UfoPreviewSbar { PeekViewNormal },
    UfoPreviewThumb { bg = '#394a4b' },
    UfoFoldedEllipsis { fg = '#989ca0' },

    --
    -- nvim-bqf
    --
    BqfPreviewFloat { PeekViewNormal },
    BqfPreviewBorder { PeekViewBorder },
    BqfPreviewCursor { Cursor },
    BqfPreviewCursorLine { PeekViewCursorLine },
    BqfPreviewRange { PeekViewMatchHighlight },
    BqfPreviewBufLabel { fg = '#8f989e' }, -- descriptionForeground with PeekViewNormal's bg as the background
    BqfSign { fg = blue_green },

    --
    -- Symbols-outline
    --
    FocusedSymbol { fg = white, bg = selection_blue },
    SymbolsOutlineConnector { fg = '#585858' },

    --
    -- mg979/tabline.nvim
    --
    TSelect { TabLineSel },
    TVisible { TabLine },
    THidden { TabLine },
    TExtra { TabLine },
    TSpecial { TabLine },
    TFill { TabLineFill },
    TCorner { fg = white, bg = black2 },
    TNumSel { TSelect },
    TNum { TabLine },
    TSelectMod { TSelect },
    TVisibleMod { TVisible },
    THiddenMod { THidden },
    TExtraMod { TExtra },
    TSpecialMod { TSpecial },
    TSelectDim { TSelect },
    TVisibleDim { TVisible },
    THiddenDim { THidden },
    TExtraDim { TExtra },
    TSpecialDim { TSpecial },
    TSelectSep { TabBorder },
    TVisibleSep { TabBorder },
    THiddenSep { TabBorder },
    TExtraSep { TabBorder },
    TSpecialSep { TabBorder },
  }
end)
---@diagnostic enable

return theme

