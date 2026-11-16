local mainFormHost = mainForm
local mainFormRoot = mainFormHost:GetChildChecked("MainForm2Root", false)
local mainForm = setmetatable({}, {
	__index = function(_, key)
		if key == "CreateWidgetByDesc" then
			return function(_, desc) return mainFormHost:CreateWidgetByDesc(desc) end
		end
		local method = mainFormRoot[key]
		if type(method) == "function" then
			return function(_, ...) return method(mainFormRoot, ...) end
		end
		return method
	end
})
Global("widgets_Duo2", {})
Global("widget_Duo2", mainForm:GetChildChecked("NamePlateBar", false))
Global("widgetdesc_Duo2", widget_Duo2:GetWidgetDesc())
Global("wtControl3D_Duo2", stateMainForm:GetChildChecked("MainAddonMainForm", false):GetChildChecked("MainScreenControl3D", false))
Global("widgetsMini_Duo2", {})
Global("widgetMini_Duo2", mainForm:GetChildChecked("BuffMiniBar", false))
Global("widgetdescMini_Duo2", widgetMini_Duo2:GetWidgetDesc())
Global("BuffInternal_Duo2", mainForm:GetChildChecked("BuffInternal", false))
Global("BuffDesc_Duo2", BuffInternal_Duo2:GetWidgetDesc())
Global("Buff_Duo2", {})
Global("MiniBuff_Duo2", mainForm:GetChildChecked("BuffMini", false))
Global("BuffMiniDesc_Duo2", MiniBuff_Duo2:GetWidgetDesc())
Global("BuffMini_Duo2", {})
Global("UnitBar_Duo2", mainForm:GetChildChecked("UnitBar", false))
Global("UnitBarDesc_Duo2", UnitBar_Duo2:GetWidgetDesc())
Global("UnitButton_Duo2", mainForm:GetChildChecked("UnitButton", false))
Global("UnitButtonDesc_Duo2", UnitButton_Duo2:GetWidgetDesc())
Global("UnitBars_Duo2", {})
Global("UnitButtons_Duo2", {})
Global("Names_Duo2", {})
Global("Levels_Duo2", {})
Global("Icons_Duo2", {})
Global("Backgrounds_Duo2", {})
Global("Foregrounds_Duo2", {})
Global("Bubbles_Duo2", {})

-- Переменные для второго окна
Global("var_0_25b_Duo2", {})

if not unit.IsEnemy then
	unit.IsEnemy = object.IsEnemy
end

if not unit.IsFriend then
	unit.IsFriend = object.IsFriend
end

local var_0_0 = userMods.ToWString("(X_X) ")

-- Конфигурация второго окна (если нужно будет создать полноценное второе окно)
local var_0_24b = nil -- пока отключено, будем использовать только первое окно с двумя режимами

Global("MainPanel_Duo2", mainForm:GetChildChecked("MainPanel", false))
Global("FadePanel_Duo2", MainPanel_Duo2:GetChildChecked("FadePanel", false))
Global("PanelkaDND_Duo2", MainPanel_Duo2:GetChildChecked("PanelkaDND", false))
Global("PanelkaText_Duo2", PanelkaDND_Duo2:GetChildChecked("PanelkaText", false))
Global("ShowHideBtn_Duo2", mainForm:GetChildChecked("ShowHideBtn", false))
Global("SelectMode_Duo2", mainForm:GetChildChecked("SelectMode", false))
Global("Arrow_Duo2", mainForm:GetChildChecked("Arrow", false))
Global("ArrowText_Duo2", Arrow_Duo2:GetChildChecked("ArrowText", false))

local var_0_1 = MainPanel_Duo2:GetChildChecked("Selection", false)
local var_0_2 = mainForm:GetChildChecked("Gear", false)
local var_0_3 = mainForm:GetChildChecked("Runes", false)
local var_0_4 = mainForm:GetChildChecked("Fairy", false)
local var_0_5 = {}
local var_0_6 = {}
local var_0_7 = false
local var_0_8
local var_0_9 = {
	BARD = {
		g = 0.9019607843137255,
		a = 1,
		b = 0.8745098039215686,
		r = 0.41568627450980394
	},
	DRUID = {
		g = 0.4627450980392157,
		a = 1,
		b = 0.23529411764705882,
		r = 1
	},
	ENGINEER = {
		g = 0.6392156862745098,
		a = 1,
		b = 0.6941176470588235,
		r = 0.5294117647058824
	},
	MAGE = {
		g = 0.6235294117647059,
		a = 1,
		b = 1,
		r = 0.49411764705882355
	},
	NECROMANCER = {
		g = 0.27058823529411763,
		a = 1,
		b = 0.29411764705882354,
		r = 0.8156862745098039
	},
	PALADIN = {
		g = 0.8627450980392157,
		a = 1,
		b = 0.6078431372549019,
		r = 0.8117647058823529
	},
	PRIEST = {
		g = 0.8117647058823529,
		a = 1,
		b = 0.4823529411764706,
		r = 1
	},
	PSIONIC = {
		g = 0.4823529411764706,
		a = 1,
		b = 0.9607843137254902,
		r = 0.8666666666666667
	},
	STALKER = {
		g = 0.8,
		a = 1,
		b = 0.33725490196078434,
		r = 0.5882352941176471
	},
	WARRIOR = {
		g = 0.4666666666666667,
		a = 1,
		b = 0.29411764705882354,
		r = 0.5607843137254902
	},
	WARLOCK = {
		g = 0.396078431372549,
		a = 1,
		b = 0.8588235294117647,
		r = 0.49019607843137253
	},
	PET = {
		g = 0.12549019607843137,
		a = 1,
		b = 0.5019607843137255,
		r = 0.5019607843137255
	},
	REPUTATION_LEVEL_HOSTILITY = {
		g = 0,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_ENEMY = {
		g = 0.33,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_UNFRIENDLY = {
		g = 0.67,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_NEUTRAL = {
		g = 1,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_KINDLY = {
		g = 1,
		a = 1,
		b = 0,
		r = 0.67
	},
	REPUTATION_LEVEL_FRIENDLY = {
		g = 1,
		a = 1,
		b = 0,
		r = 0.33
	},
	REPUTATION_LEVEL_CONFIDENTIAL = {
		g = 1,
		a = 1,
		b = 0,
		r = 0
	}
}
local var_0_10 = {
	BARD = {
		g = 1,
		a = 1,
		b = 0.7843137254901961,
		r = 0
	},
	DRUID = {
		g = 0.5019607843137255,
		a = 1,
		b = 0,
		r = 1
	},
	ENGINEER = {
		g = 0.7176470588235294,
		a = 1,
		b = 0.7725490196078432,
		r = 0.5294117647058824
	},
	MAGE = {
		g = 0.5686274509803921,
		a = 1,
		b = 1,
		r = 0.1843137254901961
	},
	NECROMANCER = {
		g = 0.16862745098039217,
		a = 1,
		b = 0.2784313725490196,
		r = 0.9450980392156862
	},
	PALADIN = {
		g = 1,
		a = 1,
		b = 1,
		r = 0.8
	},
	PRIEST = {
		g = 0.8901960784313725,
		a = 1,
		b = 0.18823529411764706,
		r = 1
	},
	PSIONIC = {
		g = 0.5019607843137255,
		a = 1,
		b = 1,
		r = 1
	},
	STALKER = {
		g = 1,
		a = 1,
		b = 0.25098039215686274,
		r = 0.7372549019607844
	},
	WARRIOR = {
		g = 0.5411764705882353,
		a = 1,
		b = 0.3411764705882353,
		r = 0.6470588235294118
	},
	WARLOCK = {
		g = 0.396078431372549,
		a = 1,
		b = 0.8588235294117647,
		r = 0.49019607843137253
	},
	PET = {
		g = 0.12549019607843137,
		a = 1,
		b = 0.5019607843137255,
		r = 0.5019607843137255
	},
	REPUTATION_LEVEL_HOSTILITY = {
		g = 0,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_ENEMY = {
		g = 0.33,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_UNFRIENDLY = {
		g = 0.67,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_NEUTRAL = {
		g = 1,
		a = 1,
		b = 0,
		r = 1
	},
	REPUTATION_LEVEL_KINDLY = {
		g = 1,
		a = 1,
		b = 0,
		r = 0.67
	},
	REPUTATION_LEVEL_FRIENDLY = {
		g = 1,
		a = 1,
		b = 0,
		r = 0.33
	},
	REPUTATION_LEVEL_CONFIDENTIAL = {
		g = 1,
		a = 1,
		b = 0,
		r = 0
	}
}
local var_0_11 = {
	[REPUTATION_LEVEL_HOSTILITY] = "REPUTATION_LEVEL_HOSTILITY",
	[REPUTATION_LEVEL_ENEMY] = "REPUTATION_LEVEL_ENEMY",
	[REPUTATION_LEVEL_UNFRIENDLY] = "REPUTATION_LEVEL_UNFRIENDLY",
	[REPUTATION_LEVEL_NEUTRAL] = "REPUTATION_LEVEL_NEUTRAL",
	[REPUTATION_LEVEL_KINDLY] = "REPUTATION_LEVEL_KINDLY",
	[REPUTATION_LEVEL_FRIENDLY] = "REPUTATION_LEVEL_FRIENDLY",
	[REPUTATION_LEVEL_CONFIDENTIAL] = "REPUTATION_LEVEL_CONFIDENTIAL"
}
local var_0_12 = {
	[REPUTATION_LEVEL_HOSTILITY] = 3,
	[REPUTATION_LEVEL_ENEMY] = 3,
	[REPUTATION_LEVEL_UNFRIENDLY] = 3,
	[REPUTATION_LEVEL_NEUTRAL] = 2,
	[REPUTATION_LEVEL_KINDLY] = 1,
	[REPUTATION_LEVEL_FRIENDLY] = 1,
	[REPUTATION_LEVEL_CONFIDENTIAL] = 1
}
local var_0_13 = {
	[UNIT_QUALITY_COMMON] = 1,
	[UNIT_QUALITY_ELITE] = 1,
	[UNIT_QUALITY_FLAVOR_ELITE] = 6,
	[UNIT_QUALITY_MINI_BOSS] = 1,
	[UNIT_QUALITY_BOSS] = 7,
	[UNIT_QUALITY_RAID_BOSS] = 8,
	[UNIT_QUALITY_RAID_ELITE] = 1,
	[UNIT_QUALITY_CRITTER] = 1
}
local var_0_14 = 2000
local var_0_15 = 30
local var_0_16 = 10
local var_0_17 = "eng"
local var_0_18 = "s"
local var_0_19 = "m"
local var_0_20 = "h"
local var_0_21 = {}
local var_0_22
local var_0_23
local var_0_24 = GetConfig("config_Duo2")
local var_0_25 = {}
local var_0_26

Global("OptionsNew_Duo2", mainForm:GetChildChecked("OptionsNew", false))
Global("Header_Duo2", OptionsNew_Duo2:GetChildChecked("Header", false))
Global("FabButton_Duo2", OptionsNew_Duo2:GetChildChecked("FabButton", false))

local var_0_27 = true

Global("PageSelector_Duo2", Header_Duo2:GetChildChecked("PageSelector", false))
Global("Pages_Duo2", OptionsNew_Duo2:GetChildChecked("Pages", false))
Global("PageBuffs_Duo2", Pages_Duo2:GetChildChecked("PageBuffs", false))
Global("PageMark_Duo2", Pages_Duo2:GetChildChecked("PageMark", false))
Global("PageBuffsContainer_Duo2", PageBuffs_Duo2:GetChildChecked("Container", false))
Global("PageBuffsItem_Duo2", mainForm:GetChildChecked("PageBuffsItem", false))
Global("PageBuffsItemDesc_Duo2", PageBuffsItem_Duo2:GetWidgetDesc())
Global("PageBuffsItems_Duo2", {})
Global("PageOpts_Duo2", Pages_Duo2:GetChildChecked("PageOpts", false))
Global("PageOptsContainer_Duo2", PageOpts_Duo2:GetChildChecked("Container", false))
Global("OptionCheckBox_Duo2", PageOpts_Duo2:GetChildChecked("OptionCheckBox", false))
Global("OptionCheckBoxDesc_Duo2", OptionCheckBox_Duo2:GetWidgetDesc())
Global("OptionLabel_Duo2", PageOpts_Duo2:GetChildChecked("OptionLabel", false))
Global("OptionLabelDesc_Duo2", OptionLabel_Duo2:GetWidgetDesc())
Global("OptionSelector_Duo2", PageOpts_Duo2:GetChildChecked("OptionSelector", false))
Global("OptionSelectorDesc_Duo2", OptionSelector_Duo2:GetWidgetDesc())
Global("OptionButton_Duo2", PageOpts_Duo2:GetChildChecked("OptionButton", false))
Global("OptionButtonDesc_Duo2", OptionButton_Duo2:GetWidgetDesc())
Global("OptionBase_Duo2", {})
Global("FlagMark_Duo2", PageMark_Duo2:GetChildChecked("ItemShowMark", false):GetChildChecked("CheckBoxButton", false))

local var_0_28 = GetConfig("DataBase70_Duo2")
local var_0_29 = {}
local var_0_30 = {}
local var_0_31 = {}
local var_0_32 = {}

Global("Target_Duo2", mainForm:GetChildChecked("Target", false))
Global("TargetDesc_Duo2", Target_Duo2:GetWidgetDesc())
Global("Targets_Duo2", {})
Global("Container_Duo2", PageMark_Duo2:GetChildChecked("Container", false))
Global("ContainerItem_Duo2", PageMark_Duo2:GetChildChecked("ContainerItem", false))
Global("ContainerItemDesc_Duo2", ContainerItem_Duo2:GetWidgetDesc())
Global("ContainerItems_Duo2", {})
Global("PreviewA_Duo2", PageMark_Duo2:GetChildChecked("Preview", false):GetChildChecked("PreviewA", false))
Global("PreviewB_Duo2", PageMark_Duo2:GetChildChecked("Preview", false):GetChildChecked("PreviewB", false))
Global("PreviewC_Duo2", PageMark_Duo2:GetChildChecked("Preview", false):GetChildChecked("PreviewC", false))
Global("TargetsDB_Duo2", {
	{
		height = -1,
		name = "Classic",
		max_size = 150,
		rotate_speed = 7000,
		min_size = 120,
		resize_speed = 500,
		enemy = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		neutral = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		friend = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		blend = BLEND_EFFECT_HIGHLIGHT
	},
	{
		height = -1,
		name = "Classic Colored",
		max_size = 150,
		rotate_speed = 7000,
		min_size = 120,
		resize_speed = 500,
		enemy = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 0,
				a = 1,
				b = 0,
				r = 1
			}
		},
		neutral = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		friend = {
			back = "ClassicTarget",
			front = "ClassicTargetHighlight",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 0
			}
		},
		blend = BLEND_EFFECT_HIGHLIGHT
	},
	{
		height = -1,
		name = "Lite",
		max_size = 150,
		rotate_speed = 7000,
		min_size = 120,
		resize_speed = 500,
		enemy = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		neutral = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		friend = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		blend = BLEND_EFFECT_ALPHABLND
	},
	{
		height = -1,
		name = "Lite Colored",
		max_size = 150,
		rotate_speed = 7000,
		min_size = 120,
		resize_speed = 500,
		enemy = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 0,
				a = 1,
				b = 0,
				r = 1
			}
		},
		neutral = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		friend = {
			back = "ClassicTarget",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 0
			}
		},
		blend = BLEND_EFFECT_ALPHABLND
	},
	{
		height = -1,
		name = "Targets Manager",
		max_size = 190,
		rotate_speed = 10000,
		min_size = 170,
		resize_speed = 800,
		enemy = {
			back = "TMEnemy",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		neutral = {
			back = "TMNeutral",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		friend = {
			back = "TMFriend",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		blend = BLEND_EFFECT_ALPHABLND
	},
	{
		height = 0,
		name = "Worms",
		max_size = 130,
		rotate_speed = 0,
		min_size = 110,
		resize_speed = 600,
		enemy = {
			back = "Worms",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		neutral = {
			back = "Worms",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		friend = {
			back = "Worms",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 1,
				r = 1
			}
		},
		blend = BLEND_EFFECT_ALPHABLND
	},
	{
		height = 0,
		name = "Big Arrow",
		max_size = 500,
		rotate_speed = 0,
		min_size = 460,
		resize_speed = 600,
		enemy = {
			back = "Arrow",
			front = "Empty",
			color = {
				g = 0,
				a = 1,
				b = 0,
				r = 1
			}
		},
		neutral = {
			back = "Arrow",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 1
			}
		},
		friend = {
			back = "Arrow",
			front = "Empty",
			color = {
				g = 1,
				a = 1,
				b = 0,
				r = 0
			}
		},
		blend = BLEND_EFFECT_ALPHABLND
	}
})

function SetPreview_Duo2(arg_1_0)
	PreviewA_Duo2:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].enemy.back))
	PreviewA_Duo2:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].enemy.front))
	PreviewA_Duo2:SetBackgroundColor(TargetsDB_Duo2[arg_1_0].enemy.color)
	PreviewA_Duo2:SetForegroundColor(TargetsDB_Duo2[arg_1_0].enemy.color)
	PreviewA_Duo2:SetForegroundBlendEffect(TargetsDB_Duo2[arg_1_0].blend)
	PreviewB_Duo2:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].friend.back))
	PreviewB_Duo2:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].friend.front))
	PreviewB_Duo2:SetBackgroundColor(TargetsDB_Duo2[arg_1_0].friend.color)
	PreviewB_Duo2:SetForegroundColor(TargetsDB_Duo2[arg_1_0].friend.color)
	PreviewB_Duo2:SetForegroundBlendEffect(TargetsDB_Duo2[arg_1_0].blend)
	PreviewC_Duo2:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].neutral.back))
	PreviewC_Duo2:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[arg_1_0].neutral.front))
	PreviewC_Duo2:SetBackgroundColor(TargetsDB_Duo2[arg_1_0].neutral.color)
	PreviewC_Duo2:SetForegroundColor(TargetsDB_Duo2[arg_1_0].neutral.color)
	PreviewC_Duo2:SetForegroundBlendEffect(TargetsDB_Duo2[arg_1_0].blend)
end

function SelectVarOfTarget_Duo2(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(ContainerItems_Duo2) do
		iter_2_1:SetVariant(0)

		if iter_2_1:IsEqual(arg_2_0.widget_Duo2) then
			iter_2_1:SetVariant(1)

			var_0_24.current_target = iter_2_0

			SetPreview_Duo2(iter_2_0)
		end
	end
end

function GetGameLocalization_Duo2()
	return common.GetLocalization()
end

function L_Duo2(arg_4_0)
	if Locales[var_0_17] and Locales[var_0_17][arg_4_0] then
		return Locales[var_0_17][arg_4_0]
	else
		return Locales.eng[arg_4_0] or arg_4_0
	end
end

function GetTableSize_Duo2(arg_5_0)
	if not arg_5_0 then
		return 0
	end

	local var_5_0 = 0

	for iter_5_0, iter_5_1 in pairs(arg_5_0) do
		var_5_0 = var_5_0 + 1
	end

	return var_5_0
end

function MoveWidget_Duo2(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0:GetPlacementPlain()

	if arg_6_1.posX then
		var_6_0.posX = arg_6_1.posX
	end

	if arg_6_1.posY then
		var_6_0.posY = arg_6_1.posY
	end

	if arg_6_1.highPosX then
		var_6_0.highPosX = arg_6_1.highPosX
	end

	if arg_6_1.highPosY then
		var_6_0.highPosY = arg_6_1.highPosY
	end

	if arg_6_1.sizeX then
		var_6_0.sizeX = arg_6_1.sizeX
	end

	if arg_6_1.sizeY then
		var_6_0.sizeY = arg_6_1.sizeY
	end

	arg_6_0:SetPlacementPlain(var_6_0)
end

function Round_Duo2(arg_7_0, arg_7_1)
	local var_7_0 = 10^(arg_7_1 or 0)

	return math.floor(arg_7_0 * var_7_0 + 0.5) / var_7_0
end

function eventAvatarTargetChanged_Duo2()
	local var_8_0 = avatar.GetTarget()
	local var_8_1 = avatar.GetId()

	var_0_2:Show(false)
	var_0_3:Show(false)
	var_0_4:Show(false)
	var_0_1:Show(false)

	for iter_8_0, iter_8_1 in pairs(Targets_Duo2) do
		if Targets_Duo2[iter_8_0] then
			wtControl3D_Duo2:RemoveWidget3D(Targets_Duo2[iter_8_0])
			Targets_Duo2[iter_8_0]:DestroyWidget()

			Targets_Duo2[iter_8_0] = nil
		end
	end

	if var_8_0 and object.IsExist(var_8_0) and object.IsUnit(var_8_0) then
		if var_0_24.show_mark == true and var_8_0 ~= var_8_1 and object.GetPos(var_8_1) then
			Targets_Duo2[var_8_0] = mainForm:CreateWidgetByDesc(TargetDesc_Duo2)
			var_0_31.sizeX = TargetsDB_Duo2[var_0_24.current_target].max_size
			var_0_31.sizeY = TargetsDB_Duo2[var_0_24.current_target].max_size
			var_0_32.sizeX = TargetsDB_Duo2[var_0_24.current_target].min_size
			var_0_32.sizeY = TargetsDB_Duo2[var_0_24.current_target].min_size

			if TargetsDB_Duo2[var_0_24.current_target].resize_speed > 0 then
				Targets_Duo2[var_8_0]:PlayResizeEffect(var_0_31, var_0_32, TargetsDB_Duo2[var_0_24.current_target].resize_speed, EA_SYMMETRIC_FLASH)
			else
				Targets_Duo2[var_8_0]:SetPlacementPlain(var_0_31)
			end

			if TargetsDB_Duo2[var_0_24.current_target].rotate_speed > 0 then
				Targets_Duo2[var_8_0]:PlayRotationEffect(0, -2 * math.pi, TargetsDB_Duo2[var_0_24.current_target].rotate_speed, EA_MONOTONOUS_INCREASE)
			end

			if unit.IsEnemy(var_8_0) then
				Targets_Duo2[var_8_0]:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].enemy.back))
				Targets_Duo2[var_8_0]:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].enemy.front))
				Targets_Duo2[var_8_0]:SetBackgroundColor(TargetsDB_Duo2[var_0_24.current_target].enemy.color)
				Targets_Duo2[var_8_0]:SetForegroundColor(TargetsDB_Duo2[var_0_24.current_target].enemy.color)
				Targets_Duo2[var_8_0]:SetForegroundBlendEffect(TargetsDB_Duo2[var_0_24.current_target].blend)
			elseif unit.IsFriend(var_8_0) then
				Targets_Duo2[var_8_0]:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].friend.back))
				Targets_Duo2[var_8_0]:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].friend.front))
				Targets_Duo2[var_8_0]:SetBackgroundColor(TargetsDB_Duo2[var_0_24.current_target].friend.color)
				Targets_Duo2[var_8_0]:SetForegroundColor(TargetsDB_Duo2[var_0_24.current_target].friend.color)
				Targets_Duo2[var_8_0]:SetForegroundBlendEffect(TargetsDB_Duo2[var_0_24.current_target].blend)
			else
				Targets_Duo2[var_8_0]:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].neutral.back))
				Targets_Duo2[var_8_0]:SetForegroundTexture(common.GetAddonRelatedGroupTexture("Targets", TargetsDB_Duo2[var_0_24.current_target].neutral.front))
				Targets_Duo2[var_8_0]:SetBackgroundColor(TargetsDB_Duo2[var_0_24.current_target].neutral.color)
				Targets_Duo2[var_8_0]:SetForegroundColor(TargetsDB_Duo2[var_0_24.current_target].neutral.color)
				Targets_Duo2[var_8_0]:SetForegroundBlendEffect(TargetsDB_Duo2[var_0_24.current_target].blend)
			end

			wtControl3D_Duo2:AddWidget3D(Targets_Duo2[var_8_0], {
				sizeY = 2,
				sizeX = 2
			}, object.GetPos(var_8_1), true, false, 1000, WIDGET_3D_BIND_POINT_CENTER, 1, 1)
			object.AttachWidget3D(var_8_0, wtControl3D_Duo2, Targets_Duo2[var_8_0], TargetsDB_Duo2[var_0_24.current_target].height)
			Targets_Duo2[var_8_0]:Show(var_0_24.show_mark)
		end

		if var_0_5[var_8_0] and var_0_5[var_8_0] > 0 and var_0_25[var_0_5[var_8_0]] and var_0_25[var_0_5[var_8_0]].drawed then
			MoveWidget_Duo2(var_0_1, {
				posX = var_0_16 - 2 + (var_0_25[var_0_5[var_8_0]].X - 1) * var_0_22,
				posY = var_0_15 - 2 + (var_0_25[var_0_5[var_8_0]].Y - 1) * var_0_23,
				sizeX = var_0_22 + 4,
				sizeY = var_0_23 + 4
			})
			var_0_1:Show(true)
		end

		if var_0_24.show_gear == true and unit.IsPlayer(var_8_0) then
			GS.RequestInfo(var_8_0)
		end
	end

	Arrow_Duo2:Show(false)

	if var_0_24.show_arrow == true and var_8_0 and object.IsExist(var_8_0) and var_8_0 ~= var_8_1 then
		local var_8_2 = object.GetPos(var_8_0)

		if var_8_2 then
			CreateArrow_Duo2(var_8_2)
			Arrow_Duo2:Show(var_0_24.show_arrow)
		else
			Arrow_Duo2:Show(false)
		end
	end
end

function eventObjectHealthChanged_Duo2(arg_9_0)
	if arg_9_0.id and object.IsExist(arg_9_0.id) and object.IsUnit(arg_9_0.id) and var_0_5[arg_9_0.id] and var_0_5[arg_9_0.id] > 0 and var_0_25[var_0_5[arg_9_0.id]] and var_0_25[var_0_5[arg_9_0.id]].drawed then
		local var_9_0 = object.GetHealthInfo(arg_9_0.id)

		if var_9_0 then
			local var_9_1 = object.GetHealthInfo(arg_9_0.id).valuePercents

			if var_9_1 then
				MoveWidget_Duo2(Foregrounds_Duo2[var_0_25[var_0_5[arg_9_0.id]].X][var_0_25[var_0_5[arg_9_0.id]].Y], {
					highPosX = math.ceil((var_0_22 - 20) * (100 - var_9_1) / 100)
				})
			end

			if var_9_0.isInvulnerable then
				Bubbles_Duo2[var_0_25[var_0_5[arg_9_0.id]].X][var_0_25[var_0_5[arg_9_0.id]].Y]:Show(true)
			else
				Bubbles_Duo2[var_0_25[var_0_5[arg_9_0.id]].X][var_0_25[var_0_5[arg_9_0.id]].Y]:Show(false)
			end
		end
	end
end

function eventObjectSelectableChanged_Duo2(arg_10_0)
	if arg_10_0.objectId and object.IsExist(arg_10_0.objectId) and object.IsUnit(arg_10_0.objectId) and var_0_5[arg_10_0.objectId] and var_0_5[arg_10_0.objectId] > 0 and var_0_25[var_0_5[arg_10_0.objectId]] and var_0_25[var_0_5[arg_10_0.objectId]].drawed then
		if unit.CanSelectTarget(arg_10_0.objectId) then
			Names_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:SetFade(1)
			Foregrounds_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:SetFade(1)
			UnitButtons_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:Show(true)
			UnitButtons_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:Enable(true)
		else
			Names_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:SetFade(0.5)
			Foregrounds_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:SetFade(0.5)
			UnitButtons_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:Show(true)
			UnitButtons_Duo2[var_0_25[var_0_5[arg_10_0.objectId]].X][var_0_25[var_0_5[arg_10_0.objectId]].Y]:Enable(false)
		end
	end
end

function eventUnitDeadChanged_Duo2(arg_11_0)
	if arg_11_0.unitId and object.IsExist(arg_11_0.unitId) and object.IsUnit(arg_11_0.unitId) and var_0_5[arg_11_0.unitId] and var_0_5[arg_11_0.unitId] > 0 and var_0_25[var_0_5[arg_11_0.unitId]] and var_0_25[var_0_5[arg_11_0.unitId]].drawed then
		if object.IsDead(arg_11_0.unitId) then
			Names_Duo2[var_0_25[var_0_5[arg_11_0.unitId]].X][var_0_25[var_0_5[arg_11_0.unitId]].Y]:SetVal("Dead", var_0_0)
		else
			Names_Duo2[var_0_25[var_0_5[arg_11_0.unitId]].X][var_0_25[var_0_5[arg_11_0.unitId]].Y]:SetVal("Dead", common.GetEmptyWString())
		end
	end
end

function eventObjectCombatChanged_Duo2(arg_12_0)
	if var_0_24.Rezhim == 3 and var_0_24.multi_columns == true and arg_12_0.objectId and object.IsExist(arg_12_0.objectId) and object.IsUnit(arg_12_0.objectId) and var_0_5[arg_12_0.objectId] and var_0_5[arg_12_0.objectId] > 0 and var_0_25[var_0_5[arg_12_0.objectId]] and var_0_25[var_0_5[arg_12_0.objectId]].drawed then
		var_0_26 = true
	end
end

function eventRelationChanged_Duo2(arg_13_0)
	if (var_0_24.Rezhim == 1 or var_0_24.Rezhim == 2 or var_0_24.Rezhim == 4) and arg_13_0.unitId and object.IsExist(arg_13_0.unitId) and object.IsUnit(arg_13_0.unitId) and (unit.IsPlayer(arg_13_0.unitId) or unit.IsPet(arg_13_0.unitId)) and var_0_5[arg_13_0.unitId] then
		var_0_26 = true

		if var_0_24.Rezhim == 1 or var_0_24.Rezhim == 2 then
			if Buff_Duo2[arg_13_0.unitId] then
				for iter_13_0, iter_13_1 in pairs(Buff_Duo2[arg_13_0.unitId]) do
					Buff_Duo2[arg_13_0.unitId][iter_13_0]:DestroyWidget()

					Buff_Duo2[arg_13_0.unitId][iter_13_0] = nil
				end

				Buff_Duo2[arg_13_0.unitId] = nil
			end

			var_0_21[arg_13_0.unitId] = nil

			if BuffMini_Duo2[arg_13_0.unitId] then
				for iter_13_2, iter_13_3 in pairs(BuffMini_Duo2[arg_13_0.unitId]) do
					BuffMini_Duo2[arg_13_0.unitId][iter_13_2]:DestroyWidget()

					BuffMini_Duo2[arg_13_0.unitId][iter_13_2] = nil
				end

				BuffMini_Duo2[arg_13_0.unitId] = nil
			end

			if var_0_24.Rezhim == 1 and unit.IsEnemy(arg_13_0.unitId) or var_0_24.Rezhim == 2 and not unit.IsEnemy(arg_13_0.unitId) then
				StartUpAddBuff_Duo2(arg_13_0.unitId)
			end
		end
	end
end

function eventEffectFinished_Duo2(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(Targets_Duo2) do
		if arg_14_0.wtOwner:IsEqual(Targets_Duo2[iter_14_0]) then
			if arg_14_0.effectType == ET_TEXTURE_ROTATION then
				local var_14_0 = TargetsDB_Duo2[var_0_24.current_target].rotate_speed

				if var_14_0 > 0 then
					Targets_Duo2[iter_14_0]:PlayRotationEffect(0, -2 * math.pi, var_14_0, EA_MONOTONOUS_INCREASE)
				end
			end

			if arg_14_0.effectType == ET_RESIZE and TargetsDB_Duo2[var_0_24.current_target].resize_speed > 0 then
				Targets_Duo2[iter_14_0]:PlayResizeEffect(var_0_31, var_0_32, TargetsDB_Duo2[var_0_24.current_target].resize_speed, EA_SYMMETRIC_FLASH)
			end
		end
	end
end

function AvatarPosChange_Duo2()
	if var_0_24.show_arrow == true then
		local var_15_0 = avatar.GetTarget()
		local var_15_1 = avatar.GetId()

		if var_15_0 and object.IsExist(var_15_0) and var_15_0 ~= var_15_1 then
			local var_15_2 = object.GetPos(var_15_0)

			if var_15_2 then
				CreateArrow_Duo2(var_15_2)
				Arrow_Duo2:Show(var_0_24.show_arrow)
			else
				Arrow_Duo2:Show(false)
			end
		else
			Arrow_Duo2:Show(false)
		end
	end
end

function PartyPosChange_Duo2(arg_16_0)
	if var_0_24.show_arrow == true then
		local var_16_0 = avatar.GetTarget()

		if var_16_0 and object.IsExist(var_16_0) and var_16_0 == arg_16_0.id then
			local var_16_1 = object.GetPos(var_16_0)

			if var_16_1 then
				CreateArrow_Duo2(var_16_1)
				Arrow_Duo2:Show(var_0_24.show_arrow)
			else
				Arrow_Duo2:Show(false)
			end
		end
	end
end

function CreateArrow_Duo2(arg_17_0)
	local var_17_0 = avatar.GetPos()
	local var_17_1 = math.atan2(arg_17_0.posY - var_17_0.posY, arg_17_0.posX - var_17_0.posX)
	local var_17_2 = mission.GetCameraDirection()
	local var_17_3 = math.floor(math.sqrt((arg_17_0.posX - var_17_0.posX)^2 + (arg_17_0.posY - var_17_0.posY)^2 + (arg_17_0.posZ - var_17_0.posZ)^2))

	ArrowText_Duo2:SetVal("Distance", common.FormatInt(var_17_3, "%d"))
	Arrow_Duo2:Rotate(var_17_1 - var_17_2)
end

function eventLibGS_Duo2(arg_18_0)
	if var_0_24.show_gear == true and arg_18_0.unitId == avatar.GetTarget() then
		if arg_18_0.gearscore and arg_18_0.gearscoreStyle then
			var_0_2:SetVal("value", userMods.ToWString(tostring(math.floor(arg_18_0.gearscore + 0.5))))
			var_0_2:SetClassVal("class", arg_18_0.gearscoreStyle)
			var_0_2:Show(true)
		end

		if arg_18_0.fairy and arg_18_0.fairyStyle then
			var_0_4:SetVal("fairy", userMods.ToWString(arg_18_0.fairy))
			var_0_4:SetClassVal("class", arg_18_0.fairyStyle)
			var_0_4:Show(false) -- отключаем видимость ступени покровы
		end

		if arg_18_0.runes and GetTableSize_Duo2(arg_18_0.runes) > 0 then
			var_0_3:SetVal("rune1", arg_18_0.deathInsuranceLvl)
			var_0_3:SetClassVal("class1", "Relic")
			var_0_3:Show(true)
		end

		-- DRESS_SLOT_DEATHINSURANCE 21 - ladanka!
	end
end

function PrepareList_Duo2()
	local var_19_0 = 14
	local var_19_1 = 1
	local var_19_2 = 1
	local var_19_3 = 1
	local var_19_4

	if var_0_24.multi_columns == true then
		var_19_3 = 4
		var_19_0 = var_0_24.multiFontSize
		var_19_2 = var_0_24.multiShadow == true and 1 or 0

		if var_0_24.multiOutline == true then
			var_19_4 = 1
		else
			var_19_4 = 0
		end
	else
		var_19_0 = var_0_24.singleFontSize
		var_19_2 = var_0_24.singleShadow == true and 1 or 0
		var_19_4 = var_0_24.singleOutline == true and 1 or 0
	end

	if var_0_24.Rezhim == 4 or var_0_24.Rezhim == 3 and var_0_24.multi_columns == true then
		var_19_3 = 2
	end

	local var_19_5 = "<body color='0xFFFFFFFF' alignx='left' aligny='top' fontsize='" .. var_19_0 .. "' outline='" .. var_19_4 .. "' shadow='" .. var_19_2 .. "'><rs class='class'><r name='Dead' /><r name='Name' /></rs></body>"

	for iter_19_0 = 1, 4 do
		for iter_19_1 = 1, 24 do
			MoveWidget_Duo2(UnitBars_Duo2[iter_19_0][iter_19_1], {
				posX = var_0_16 + (iter_19_0 - 1) * var_0_22,
				posY = var_0_15 + (iter_19_1 - 1) * var_0_23,
				sizeX = var_0_22,
				sizeY = var_0_23
			})
			MoveWidget_Duo2(UnitButtons_Duo2[iter_19_0][iter_19_1], {
				posX = var_0_16 + (iter_19_0 - 1) * var_0_22,
				posY = var_0_15 + (iter_19_1 - 1) * var_0_23,
				sizeX = var_0_22,
				sizeY = var_0_23
			})
			Names_Duo2[iter_19_0][iter_19_1]:SetFormat(userMods.ToWString(var_19_5))
			Names_Duo2[iter_19_0][iter_19_1]:SetClassVal("class", "tip_white")
		end
	end

	MoveWidget_Duo2(MainPanel_Duo2, {
		sizeX = math.max(var_0_16 * 2 + var_0_22 * var_19_3, 191),
		sizeY = var_0_15 + var_0_24.maxRows * var_0_23
	})
end

function HideList_Duo2()
	for iter_20_0 = 1, 4 do
		for iter_20_1 = 1, 24 do
			UnitBars_Duo2[iter_20_0][iter_20_1]:Show(false)
			UnitButtons_Duo2[iter_20_0][iter_20_1]:Show(false)
			UnitButtons_Duo2[iter_20_0][iter_20_1]:Enable(false)
		end
	end

	HideBuffMini_Duo2()
end

function HideBuffMini_Duo2()
	for iter_21_0, iter_21_1 in pairs(widgetsMini_Duo2) do
		if iter_21_1 and iter_21_1:IsVisible() then
			MoveWidget_Duo2(iter_21_1, {
				posY = -100,
				sizeY = 20
			})
		end
	end
end

function RepaintList_Duo2()
	HideList_Duo2()
	var_0_1:Show(false)

	local var_22_0 = avatar.GetTarget()

	for iter_22_0, iter_22_1 in pairs(var_0_25) do
		if iter_22_1.Y <= math.min(var_0_24.maxRows, 24) then
			Foregrounds_Duo2[iter_22_1.X][iter_22_1.Y]:SetBackgroundColor(var_0_10[iter_22_1.class])
			Icons_Duo2[iter_22_1.X][iter_22_1.Y]:SetBackgroundTexture(common.GetAddonRelatedGroupTexture("PlayerClasses", iter_22_1.icon))
			Icons_Duo2[iter_22_1.X][iter_22_1.Y]:SetBackgroundColor(var_0_9[iter_22_1.class])
			Names_Duo2[iter_22_1.X][iter_22_1.Y]:SetVal("Name", iter_22_1.name)

			if iter_22_1.dead then
				Names_Duo2[iter_22_1.X][iter_22_1.Y]:SetVal("Dead", var_0_0)
			else
				Names_Duo2[iter_22_1.X][iter_22_1.Y]:SetVal("Dead", common.GetEmptyWString())
			end

			Levels_Duo2[iter_22_1.X][iter_22_1.Y]:SetVal("Level", iter_22_1.level)
			UnitBars_Duo2[iter_22_1.X][iter_22_1.Y]:Show(true)
			MoveWidget_Duo2(Foregrounds_Duo2[iter_22_1.X][iter_22_1.Y], {
				highPosX = math.ceil((var_0_22 - 20) * (100 - iter_22_1.percent) / 100)
			})

			if iter_22_1.bubble == true then
				Bubbles_Duo2[iter_22_1.X][iter_22_1.Y]:Show(true)
			else
				Bubbles_Duo2[iter_22_1.X][iter_22_1.Y]:Show(false)
			end

			if iter_22_1.selectable == true then
				Names_Duo2[iter_22_1.X][iter_22_1.Y]:SetFade(1)
				Foregrounds_Duo2[iter_22_1.X][iter_22_1.Y]:SetFade(1)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:SetName("PlayerButton_" .. iter_22_1.id)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:Show(true)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:Enable(true)
			else
				Names_Duo2[iter_22_1.X][iter_22_1.Y]:SetFade(0.5)
				Foregrounds_Duo2[iter_22_1.X][iter_22_1.Y]:SetFade(0.5)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:SetName("PlayerButton_" .. iter_22_1.id)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:Show(true)
				UnitButtons_Duo2[iter_22_1.X][iter_22_1.Y]:Enable(false)
			end

			if var_0_24.show_mini == true and iter_22_1.id and widgetsMini_Duo2[iter_22_1.id] and widgetsMini_Duo2[iter_22_1.id]:IsVisible() then
				MoveWidget_Duo2(widgetsMini_Duo2[iter_22_1.id], {
					posX = var_0_16 + 20 + (iter_22_1.X - 1) * var_0_22,
					posY = var_0_15 + (iter_22_1.Y - 1) * var_0_23,
					sizeX = var_0_22 - 20,
					sizeY = var_0_23
				})
			end

			if var_22_0 and iter_22_1.id and var_22_0 == iter_22_1.id then
				MoveWidget_Duo2(var_0_1, {
					posX = var_0_16 - 2 + (iter_22_1.X - 1) * var_0_22,
					posY = var_0_15 - 2 + (iter_22_1.Y - 1) * var_0_23,
					sizeX = var_0_22 + 4,
					sizeY = var_0_23 + 4
				})
				var_0_1:Show(true)
			end

			if iter_22_1.id and var_0_5[iter_22_1.id] then
				var_0_5[iter_22_1.id] = iter_22_0
			end

			var_0_25[iter_22_0].drawed = true
		end
	end
end

function reactionSelectTarget_Duo2(arg_23_0)
	local var_23_0 = tonumber(string.sub(arg_23_0.sender, 14))

	if var_23_0 and object.IsExist(var_23_0) then
		avatar.SelectTarget(var_23_0)
	end
end

function eventUnitsChanged_Duo2(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.spawned) do
		var_0_5[iter_24_1] = 0

		if var_0_7 == false and var_0_24.disable_buffs == false and var_0_6[iter_24_1] == nil then
			var_0_6[iter_24_1] = {
				objectId = iter_24_1
			}

			common.RegisterEventHandler(eventBuffsChanged_Duo2, "EVENT_OBJECT_BUFFS_CHANGED", var_0_6[iter_24_1])
			common.RegisterEventHandler(eventBuffsAdded_Duo2, "EVENT_OBJECT_BUFF_ADDED", var_0_6[iter_24_1])
		end
	end

	for iter_24_2, iter_24_3 in pairs(arg_24_0.despawned) do
		var_0_5[iter_24_3] = nil

		if var_0_7 == false and var_0_24.disable_buffs == false and var_0_6[iter_24_3] then
			common.UnRegisterEventHandler(eventBuffsChanged_Duo2, "EVENT_OBJECT_BUFFS_CHANGED", var_0_6[iter_24_3])
			common.UnRegisterEventHandler(eventBuffsAdded_Duo2, "EVENT_OBJECT_BUFF_ADDED", var_0_6[iter_24_3])

			var_0_6[iter_24_3] = nil
		end

		if Buff_Duo2[iter_24_3] then
			for iter_24_4, iter_24_5 in pairs(Buff_Duo2[iter_24_3]) do
				Buff_Duo2[iter_24_3][iter_24_4]:DestroyWidget()

				Buff_Duo2[iter_24_3][iter_24_4] = nil
			end

			Buff_Duo2[iter_24_3] = nil
		end

		var_0_21[iter_24_3] = nil

		if BuffMini_Duo2[iter_24_3] then
			for iter_24_6, iter_24_7 in pairs(BuffMini_Duo2[iter_24_3]) do
				BuffMini_Duo2[iter_24_3][iter_24_6]:DestroyWidget()

				BuffMini_Duo2[iter_24_3][iter_24_6] = nil
			end

			BuffMini_Duo2[iter_24_3] = nil
		end

		if widgets_Duo2[iter_24_3] then
			wtControl3D_Duo2:RemoveWidget3D(widgets_Duo2[iter_24_3])
			widgets_Duo2[iter_24_3]:DestroyWidget()

			widgets_Duo2[iter_24_3] = nil
		end

		if widgetsMini_Duo2[iter_24_3] then
			widgetsMini_Duo2[iter_24_3]:DestroyWidget()

			widgetsMini_Duo2[iter_24_3] = nil
		end
	end

	for iter_24_8, iter_24_9 in pairs(var_0_5) do
		var_0_5[iter_24_8] = 0

		if not widgets_Duo2[iter_24_8] and not widgetsMini_Duo2[iter_24_8] then
			CreateNamePlate_Duo2(iter_24_8)
		end

		if widgets_Duo2[iter_24_8] then
			widgets_Duo2[iter_24_8]:Show(true)
		end

		if widgetsMini_Duo2[iter_24_8] then
			widgetsMini_Duo2[iter_24_8]:Show(true)
		end
	end

	CollectUnits_Duo2()
end

function CollectUnits_Duo2()
	var_0_25 = {}

	if var_0_24.show_panel == true then
		local var_25_0 = 1
		local var_25_1 = 0
		local var_25_2 = 0

		if var_0_24.Rezhim == 1 or var_0_24.Rezhim == 2 or var_0_24.Rezhim == 4 then
			for iter_25_0, iter_25_1 in pairs(var_0_5) do
				if object.IsExist(iter_25_0) and object.IsUnit(iter_25_0) and not common.IsEmptyWString(object.GetName(iter_25_0)) then
					if unit.IsPlayer(iter_25_0) and (var_0_24.Rezhim == 2 and not unit.IsEnemy(iter_25_0) or var_0_24.Rezhim == 1 and unit.IsEnemy(iter_25_0) or var_0_24.Rezhim == 4) then
						var_0_25[var_25_0] = {}
						var_0_25[var_25_0] = {}
						var_0_25[var_25_0].id = iter_25_0
						var_0_25[var_25_0].name = object.GetName(iter_25_0)
						var_0_25[var_25_0].dead = object.IsDead(iter_25_0)
						var_0_25[var_25_0].level = common.FormatInt(unit.GetLevel(iter_25_0), "%d")
						var_0_25[var_25_0].class = unit.GetClass(iter_25_0).className
						var_0_25[var_25_0].icon = unit.GetClass(iter_25_0).className
						var_0_25[var_25_0].priority = var_0_24.priority[var_0_25[var_25_0].class]
						var_0_25[var_25_0].percent = 100
						var_0_25[var_25_0].bubble = false

						local var_25_3 = object.GetHealthInfo(iter_25_0)

						if var_25_3 then
							local var_25_4 = var_25_3.valuePercents

							if var_25_4 then
								var_0_25[var_25_0].percent = var_25_4
							end

							if var_25_3.isInvulnerable then
								var_0_25[var_25_0].bubble = true
							end
						end

						var_0_25[var_25_0].selectable = false

						if unit.CanSelectTarget(iter_25_0) then
							var_0_25[var_25_0].selectable = true
						end

						if var_0_24.Rezhim == 4 then
							if unit.IsEnemy(iter_25_0) then
								var_0_25[var_25_0].X = 2
								var_25_2 = var_25_2 + 1
							else
								var_0_25[var_25_0].X = 1
								var_25_1 = var_25_1 + 1
							end
						else
							if var_0_24.multi_columns == false then
								var_0_25[var_25_0].X = 1
							else
								var_0_25[var_25_0].X = var_0_24.column[var_0_25[var_25_0].class]
							end

							var_25_1 = var_25_1 + 1
						end

						var_25_0 = var_25_0 + 1
					elseif var_0_24.show_pets == true and not unit.IsPlayer(iter_25_0) and unit.IsPet(iter_25_0) and (var_0_24.Rezhim == 2 and not unit.IsEnemy(iter_25_0) or var_0_24.Rezhim == 1 and unit.IsEnemy(iter_25_0) or var_0_24.Rezhim == 4) then
						var_0_25[var_25_0] = {}
						var_0_25[var_25_0] = {}
						var_0_25[var_25_0].id = iter_25_0
						var_0_25[var_25_0].name = object.GetName(iter_25_0)
						var_0_25[var_25_0].dead = object.IsDead(iter_25_0)
						var_0_25[var_25_0].level = common.FormatInt(unit.GetLevel(iter_25_0), "%d")
						var_0_25[var_25_0].class = "PET"
						var_0_25[var_25_0].icon = "PET"
						var_0_25[var_25_0].priority = var_0_24.priority[var_0_25[var_25_0].class]
						var_0_25[var_25_0].percent = 100
						var_0_25[var_25_0].bubble = false

						local var_25_5 = object.GetHealthInfo(iter_25_0)

						if var_25_5 then
							local var_25_6 = var_25_5.valuePercents

							if var_25_6 then
								var_0_25[var_25_0].percent = var_25_6
							end

							if var_25_5.isInvulnerable then
								var_0_25[var_25_0].bubble = true
							end
						end

						var_0_25[var_25_0].selectable = false

						if unit.CanSelectTarget(iter_25_0) then
							var_0_25[var_25_0].selectable = true
						end

						if var_0_24.Rezhim == 4 then
							if unit.IsEnemy(iter_25_0) then
								var_0_25[var_25_0].X = 2
							else
								var_0_25[var_25_0].X = 1
							end
						elseif var_0_24.multi_columns == false then
							var_0_25[var_25_0].X = 1
						else
							var_0_25[var_25_0].X = var_0_24.column[var_0_25[var_25_0].class]
						end

						var_25_0 = var_25_0 + 1
					end
				end
			end

			if var_25_0 > 1 then
				table.sort(var_0_25, SortUnits_Duo2)

				for iter_25_2 = 1, 4 do
					local var_25_7 = 1

					for iter_25_3, iter_25_4 in pairs(var_0_25) do
						if var_0_25[iter_25_3].X == iter_25_2 then
							var_0_25[iter_25_3].Y = var_25_7
							var_25_7 = var_25_7 + 1
						end
					end
				end
			end

			if var_0_24.Rezhim == 4 then
				PanelkaText_Duo2:SetVal("Number", userMods.ToWString(var_25_1 .. "/" .. var_25_2))
			else
				PanelkaText_Duo2:SetVal("Number", userMods.ToWString(var_25_1 .. ""))
			end
		elseif var_0_24.Rezhim == 3 then
			for iter_25_5, iter_25_6 in pairs(var_0_5) do
				if object.IsExist(iter_25_5) and object.IsUnit(iter_25_5) and not common.IsEmptyWString(object.GetName(iter_25_5)) and not unit.IsPlayer(iter_25_5) and not unit.IsPet(iter_25_5) and (var_0_24.hide_green == false or var_0_24.hide_green == true and var_0_12[unit.GetReputationLevel(iter_25_5)] > 2) then
					var_0_25[var_25_0] = {}
					var_0_25[var_25_0] = {}
					var_0_25[var_25_0].id = iter_25_5
					var_0_25[var_25_0].name = object.GetName(iter_25_5)
					var_0_25[var_25_0].dead = object.IsDead(iter_25_5)
					var_0_25[var_25_0].level = common.FormatInt(unit.GetLevel(iter_25_5), "%d")
					var_0_25[var_25_0].class = var_0_11[unit.GetReputationLevel(iter_25_5)]
					var_0_25[var_25_0].icon = "NECROMANCER"
					var_0_25[var_25_0].priority = 10000 * var_0_13[unit.GetQuality(iter_25_5)] + 1000 * var_0_12[unit.GetReputationLevel(iter_25_5)]
					var_0_25[var_25_0].percent = 100
					var_0_25[var_25_0].bubble = false

					local var_25_8 = object.GetHealthInfo(iter_25_5)

					if var_25_8 then
						local var_25_9 = var_25_8.valuePercents

						if var_25_9 then
							var_0_25[var_25_0].percent = var_25_9
						end

						if var_25_8.isInvulnerable then
							var_0_25[var_25_0].bubble = true
						end
					end

					var_0_25[var_25_0].selectable = false

					if unit.CanSelectTarget(iter_25_5) then
						var_0_25[var_25_0].selectable = true
					end

					if var_0_24.multi_columns == false then
						var_0_25[var_25_0].X = 1
					elseif object.IsInCombat(iter_25_5) then
						var_0_25[var_25_0].X = 1
					else
						var_0_25[var_25_0].X = 2
					end

					var_25_1 = var_25_1 + 1
					var_25_0 = var_25_0 + 1
				end
			end

			if var_25_0 > 1 then
				table.sort(var_0_25, SortUnits_Duo2)

				for iter_25_7 = 1, 4 do
					local var_25_10 = 1

					for iter_25_8, iter_25_9 in pairs(var_0_25) do
						if var_0_25[iter_25_8].X == iter_25_7 then
							var_0_25[iter_25_8].Y = var_25_10
							var_25_10 = var_25_10 + 1
						end
					end
				end
			end

			PanelkaText_Duo2:SetVal("Number", userMods.ToWString(var_25_1 .. ""))
		end

		RepaintList_Duo2()
	end
end

function SortUnits_Duo2(arg_26_0, arg_26_1)
	if arg_26_0.priority > arg_26_1.priority then
		return true
	elseif arg_26_0.priority < arg_26_1.priority then
		return false
	elseif common.CompareWStringEx(arg_26_0.name, arg_26_1.name) == -1 then
		if var_0_24.inverseSort == false then
			return true
		else
			return false
		end
	elseif common.CompareWStringEx(arg_26_0.name, arg_26_1.name) == 1 then
		if var_0_24.inverseSort == false then
			return false
		else
			return true
		end
	else
		return false
	end
end

function StartUpAddBuff_Duo2(arg_27_0)
	if var_0_24.disable_buffs == false then
		local var_27_0 = object.GetBuffs(arg_27_0)

		if var_27_0 then
			for iter_27_0, iter_27_1 in pairs(var_27_0) do
				eventBuffsAdded_Duo2({
					buffId = iter_27_1,
					objectId = arg_27_0
				})
			end
		end
	end
end

function CreateNamePlate_Duo2(arg_28_0)
	if arg_28_0 and object.IsExist(arg_28_0) and object.IsUnit(arg_28_0) and object.GetPos(avatar.GetId()) then
		widgets_Duo2[arg_28_0] = mainForm:CreateWidgetByDesc(widgetdesc_Duo2)

		widgets_Duo2[arg_28_0]:SetBackgroundColor({
			g = 1,
			a = 0,
			b = 0,
			r = 1
		})
		wtControl3D_Duo2:AddWidget3D(widgets_Duo2[arg_28_0], {
			sizeY = 1.55,
			sizeX = 0
		}, object.GetPos(avatar.GetId()), true, false, 400, WIDGET_3D_BIND_POINT_HIGH, 1, 2.66)
		object.AttachWidget3D(arg_28_0, wtControl3D_Duo2, widgets_Duo2[arg_28_0], 0)

		widgetsMini_Duo2[arg_28_0] = mainForm:CreateWidgetByDesc(widgetdescMini_Duo2)

		widgetsMini_Duo2[arg_28_0]:SetBackgroundColor({
			g = 1,
			a = 0,
			b = 0,
			r = 1
		})
		MainPanel_Duo2:AddChild(widgetsMini_Duo2[arg_28_0])
		StartUpAddBuff_Duo2(arg_28_0)
	end
end

function CreateBuff_Duo2(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if not Buff_Duo2[arg_29_0] then
		Buff_Duo2[arg_29_0] = {}
	end

	Buff_Duo2[arg_29_0][arg_29_2] = mainForm:CreateWidgetByDesc(BuffDesc_Duo2)

	if arg_29_1.texture then
		Buff_Duo2[arg_29_0][arg_29_2]:GetChildChecked("Icon", false):SetBackgroundTexture(arg_29_1.texture)
	end

	if arg_29_1.stackCount and arg_29_1.stackCount > 1 then
		Buff_Duo2[arg_29_0][arg_29_2]:GetChildChecked("Stack", false):SetVal("Stack", common.FormatInt(arg_29_1.stackCount, "%d"))
	end

	if arg_29_1.isPositive == true then
		Buff_Duo2[arg_29_0][arg_29_2]:GetChildChecked("Icon", false):SetForegroundColor({
			g = 1,
			a = 1,
			b = 0,
			r = 0
		})
	else
		Buff_Duo2[arg_29_0][arg_29_2]:GetChildChecked("Icon", false):SetForegroundColor({
			g = 0,
			a = 1,
			b = 0,
			r = 1
		})
	end

	if arg_29_1.durationMs > 0 and arg_29_1.remainingMs > 0 then
		local var_29_0 = arg_29_1.remainingMs
		local var_29_1 = true

		if arg_29_1.isStackable and arg_29_1.stackCount > 1 and arg_29_1.isGradual then
			var_29_1 = false
		end

		if var_29_1 == true and var_29_0 <= var_0_14 then
			Buff_Duo2[arg_29_0][arg_29_2]:PlayFadeEffect(var_29_0 / var_0_14, 0, math.max(var_29_0, 1), EA_MONOTONOUS_INCREASE)
		else
			Buff_Duo2[arg_29_0][arg_29_2]:SetFade(1)
		end

		local var_29_2 = Round_Duo2(var_29_0 / 1000)
		local var_29_3 = var_0_18

		if var_29_2 >= 60 then
			var_29_2 = Round_Duo2(var_29_2 / 60)
			var_29_3 = var_0_19

			if var_29_2 >= 60 then
				var_29_2 = Round_Duo2(var_29_2 / 60)
				var_29_3 = var_0_20
			end
		end

		if var_0_21[arg_29_0] == nil then
			var_0_21[arg_29_0] = {}
		end

		var_0_21[arg_29_0][arg_29_2] = true

		Buff_Duo2[arg_29_0][arg_29_2]:GetChildChecked("Time", false):SetVal("Time", userMods.ToWString(var_29_2 .. "" .. var_29_3))
	end

	arg_29_3:AddChild(Buff_Duo2[arg_29_0][arg_29_2])
	Buff_Duo2[arg_29_0][arg_29_2]:Show(true)
end

function CreateBuffMini_Duo2(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	if not BuffMini_Duo2[arg_30_0] then
		BuffMini_Duo2[arg_30_0] = {}
	end

	BuffMini_Duo2[arg_30_0][arg_30_2] = mainForm:CreateWidgetByDesc(BuffMiniDesc_Duo2)

	if arg_30_1.texture then
		BuffMini_Duo2[arg_30_0][arg_30_2]:SetBackgroundTexture(arg_30_1.texture)
	end

	arg_30_3:AddChild(BuffMini_Duo2[arg_30_0][arg_30_2])
	BuffMini_Duo2[arg_30_0][arg_30_2]:Show(true)
end

function UpdateBuffStack_Duo2(arg_31_0, arg_31_1, arg_31_2)
	if Buff_Duo2[arg_31_0] and Buff_Duo2[arg_31_0][arg_31_1] then
		if arg_31_2.stackCount and arg_31_2.stackCount > 1 then
			Buff_Duo2[arg_31_0][arg_31_1]:GetChildChecked("Stack", false):SetVal("Stack", common.FormatInt(arg_31_2.stackCount, "%d"))
		else
			Buff_Duo2[arg_31_0][arg_31_1]:GetChildChecked("Stack", false):ClearValues()
		end

		if arg_31_2.durationMs > 0 and arg_31_2.remainingMs > 0 then
			local var_31_0 = arg_31_2.remainingMs
			local var_31_1 = true

			if arg_31_2.isStackable and arg_31_2.stackCount > 1 and arg_31_2.isGradual then
				var_31_1 = false
			end

			if var_31_1 == true and var_31_0 <= var_0_14 then
				Buff_Duo2[arg_31_0][arg_31_1]:PlayFadeEffect(var_31_0 / var_0_14, 0, math.max(var_31_0, 1), EA_MONOTONOUS_INCREASE)
			else
				Buff_Duo2[arg_31_0][arg_31_1]:FinishFadeEffect()
				Buff_Duo2[arg_31_0][arg_31_1]:SetFade(1)
			end

			local var_31_2 = Round_Duo2(var_31_0 / 1000)
			local var_31_3 = var_0_18

			if var_31_2 >= 60 then
				var_31_2 = Round_Duo2(var_31_2 / 60)
				var_31_3 = var_0_19

				if var_31_2 >= 60 then
					var_31_2 = Round_Duo2(var_31_2 / 60)
					var_31_3 = var_0_20
				end
			end

			if var_0_21[arg_31_0] == nil then
				var_0_21[arg_31_0] = {}
			end

			var_0_21[arg_31_0][arg_31_1] = true

			Buff_Duo2[arg_31_0][arg_31_1]:GetChildChecked("Time", false):SetVal("Time", userMods.ToWString(var_31_2 .. "" .. var_31_3))
		end
	end
end

function ExistCheck_Duo2(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(Buff_Duo2[arg_32_0.objectId]) do
		local var_32_0 = true

		for iter_32_2, iter_32_3 in pairs(object.GetBuffs(arg_32_0.objectId)) do
			if iter_32_3 == iter_32_0 then
				var_32_0 = false

				break
			end
		end

		if var_32_0 == true then
			Buff_Duo2[arg_32_0.objectId][iter_32_0]:DestroyWidget()

			Buff_Duo2[arg_32_0.objectId][iter_32_0] = nil

			if BuffMini_Duo2[arg_32_0.objectId] and BuffMini_Duo2[arg_32_0.objectId][iter_32_0] then
				BuffMini_Duo2[arg_32_0.objectId][iter_32_0]:DestroyWidget()

				BuffMini_Duo2[arg_32_0.objectId][iter_32_0] = nil
			end

			if var_0_21[arg_32_0.objectId] and var_0_21[arg_32_0.objectId][iter_32_0] then
				var_0_21[arg_32_0.objectId][iter_32_0] = nil
			end
		else
			eventBuffsElementChanged_Duo2({
				objects = {
					[arg_32_0.objectId] = {
						[iter_32_0] = true
					}
				}
			})
		end
	end
end

function SortBuffs_Duo2(arg_33_0)
	if widgets_Duo2[arg_33_0] and Buff_Duo2[arg_33_0] then
		local var_33_0 = 0

		for iter_33_0, iter_33_1 in pairs(Buff_Duo2[arg_33_0]) do
			if iter_33_1 and iter_33_1:IsVisible() then
				MoveWidget_Duo2(iter_33_1, {
					posY = 10,
					posX = 40 * var_33_0
				})
				MoveWidget_Duo2(widgets_Duo2[arg_33_0], {
					sizeX = 40 * (var_33_0 + 1)
				})

				var_33_0 = var_33_0 + 1
			end
		end
	end

	local var_33_1 = var_0_24.singleIconSize

	if var_0_24.multi_columns == true then
		var_33_1 = var_0_24.multiIconSize
	end

	if widgetsMini_Duo2[arg_33_0] and BuffMini_Duo2[arg_33_0] then
		local var_33_2 = 0

		for iter_33_2, iter_33_3 in pairs(BuffMini_Duo2[arg_33_0]) do
			if iter_33_3 and iter_33_3:IsVisible() then
				if var_33_1 * (var_33_2 + 1) < var_0_22 - 20 then
					MoveWidget_Duo2(iter_33_3, {
						highPosY = 1,
						highPosX = var_33_1 * var_33_2,
						sizeX = var_33_1,
						sizeY = var_33_1
					})
				else
					MoveWidget_Duo2(iter_33_3, {
						highPosY = 1,
						highPosX = -2 - var_33_1
					})
				end

				var_33_2 = var_33_2 + 1
			end
		end
	end
end

function eventBuffsAdded_Duo2(arg_34_0)
	local var_34_0 = object.GetBuffInfo(arg_34_0.buffId)

	if arg_34_0.objectId and object.IsExist(arg_34_0.objectId) and object.IsUnit(arg_34_0.objectId) and var_34_0 and var_34_0.isNeedVisualize and var_34_0.texture then
		if var_0_24.Rezhim == 1 and unit.IsEnemy(arg_34_0.objectId) and (unit.IsPlayer(arg_34_0.objectId) or unit.IsPet(arg_34_0.objectId)) or var_0_24.Rezhim == 2 and not unit.IsEnemy(arg_34_0.objectId) and (unit.IsPlayer(arg_34_0.objectId) or unit.IsPet(arg_34_0.objectId)) or var_0_24.Rezhim == 3 and not unit.IsPlayer(arg_34_0.objectId) and not unit.IsPet(arg_34_0.objectId) or var_0_24.Rezhim == 4 and (unit.IsPlayer(arg_34_0.objectId) or unit.IsPet(arg_34_0.objectId)) then
			local var_34_1
			local var_34_2 = avatar.GetId()

			if var_0_24.Rezhim == 3 then
				var_34_1 = var_0_30[userMods.FromWString(var_34_0.name)]
			else
				var_34_1 = var_0_29[userMods.FromWString(var_34_0.name)]
			end

			if (var_34_1 or var_0_24.show_ownbuffs == true and var_34_0.producer.casterId and (var_34_0.producer.casterId == var_34_2 or unit.GetActivePet(var_34_2) and var_34_0.producer.casterId == unit.GetActivePet(var_34_2))) and widgets_Duo2[arg_34_0.objectId] and widgetsMini_Duo2[arg_34_0.objectId] then
				CreateBuff_Duo2(arg_34_0.objectId, var_34_0, arg_34_0.buffId, widgets_Duo2[arg_34_0.objectId])
				CreateBuffMini_Duo2(arg_34_0.objectId, var_34_0, arg_34_0.buffId, widgetsMini_Duo2[arg_34_0.objectId])
				SortBuffs_Duo2(arg_34_0.objectId)

				if var_34_1 and not var_34_1.icon and OptionsNew_Duo2:IsVisible() ~= true then
					var_34_1.icon = var_34_0.buffId

					if var_0_28[var_34_1.id] then
						var_0_28[var_34_1.id].icon = var_34_0.buffId

						SetConfig("DataBase70_Duo2", var_0_28)
					end
				end
			end
		elseif var_0_24.Rezhim ~= 3 and var_0_24.show_mobbuffs == true and not unit.IsPlayer(arg_34_0.objectId) and not unit.IsPet(arg_34_0.objectId) then
			local var_34_3
			local var_34_4 = avatar.GetId()
			local var_34_5 = var_0_30[userMods.FromWString(var_34_0.name)]

			if (var_34_5 or var_0_24.show_ownbuffs == true and var_34_0.producer.casterId and (var_34_0.producer.casterId == var_34_4 or unit.GetActivePet(var_34_4) and var_34_0.producer.casterId == unit.GetActivePet(var_34_4))) and widgets_Duo2[arg_34_0.objectId] and widgetsMini_Duo2[arg_34_0.objectId] then
				CreateBuff_Duo2(arg_34_0.objectId, var_34_0, arg_34_0.buffId, widgets_Duo2[arg_34_0.objectId])
				CreateBuffMini_Duo2(arg_34_0.objectId, var_34_0, arg_34_0.buffId, widgetsMini_Duo2[arg_34_0.objectId])
				SortBuffs_Duo2(arg_34_0.objectId)

				if var_34_5 and not var_34_5.icon and OptionsNew_Duo2:IsVisible() ~= true then
					var_34_5.icon = var_34_0.buffId

					if var_0_28[var_34_5.id] then
						var_0_28[var_34_5.id].icon = var_34_0.buffId

						SetConfig("DataBase70_Duo2", var_0_28)
					end
				end
			end
		end
	end
end

function eventBuffsElementChanged_Duo2(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.objects) do
		if object.IsExist(iter_35_0) and object.IsUnit(iter_35_0) and Buff_Duo2[iter_35_0] then
			for iter_35_2, iter_35_3 in pairs(iter_35_1) do
				if Buff_Duo2[iter_35_0][iter_35_2] then
					local var_35_0 = object.GetBuffInfo(iter_35_2)

					if var_35_0 then
						UpdateBuffStack_Duo2(iter_35_0, iter_35_2, var_35_0)
					end
				end
			end
		end
	end
end

function eventBuffsChanged_Duo2(arg_36_0)
	if object.IsExist(arg_36_0.objectId) and object.IsUnit(arg_36_0.objectId) and Buff_Duo2[arg_36_0.objectId] then
		ExistCheck_Duo2(arg_36_0)
		SortBuffs_Duo2(arg_36_0.objectId)
	end
end

function eventSecondTimer_Duo2()
	for iter_37_0, iter_37_1 in pairs(var_0_21) do
		for iter_37_2, iter_37_3 in pairs(iter_37_1) do
			if Buff_Duo2[iter_37_0] and Buff_Duo2[iter_37_0][iter_37_2] then
				local var_37_0

				for iter_37_4, iter_37_5 in pairs(object.GetBuffs(iter_37_0)) do
					if iter_37_5 == iter_37_2 then
						var_37_0 = object.GetBuffInfo(iter_37_5)
					end
				end

				if var_37_0 then
					local var_37_1 = var_37_0.remainingMs
					local var_37_2 = true

					if var_37_0.isStackable and var_37_0.stackCount > 1 and var_37_0.isGradual then
						var_37_2 = false
					end

					if var_37_2 == true and var_37_1 <= var_0_14 then
						local var_37_3 = Buff_Duo2[iter_37_0][iter_37_2]:GetFade()

						Buff_Duo2[iter_37_0][iter_37_2]:PlayFadeEffect(var_37_3, 0, math.max(var_37_1, 1), EA_MONOTONOUS_INCREASE)
					else
						Buff_Duo2[iter_37_0][iter_37_2]:FinishFadeEffect()
						Buff_Duo2[iter_37_0][iter_37_2]:SetFade(1)
					end

					local var_37_4 = Round_Duo2(var_37_1 / 1000)
					local var_37_5 = var_0_18

					if var_37_4 >= 60 then
						var_37_4 = Round_Duo2(var_37_4 / 60)
						var_37_5 = var_0_19

						if var_37_4 >= 60 then
							var_37_4 = Round_Duo2(var_37_4 / 60)
							var_37_5 = var_0_20
						end
					end

					var_0_21[iter_37_0][iter_37_2] = true

					Buff_Duo2[iter_37_0][iter_37_2]:GetChildChecked("Time", false):SetVal("Time", userMods.ToWString(var_37_4 .. "" .. var_37_5))
				end
			end
		end
	end

	if var_0_26 then
		CollectUnits_Duo2()

		var_0_26 = nil
	end
end

function PanelkaDNDOnPointing_Duo2(arg_38_0)
	local var_38_0 = FadePanel_Duo2:GetFade()

	FadePanel_Duo2:FinishFadeEffect()

	if arg_38_0.active then
		FadePanel_Duo2:PlayFadeEffect(var_38_0, 0.5, 50, EA_MONOTONOUS_INCREASE)
	else
		FadePanel_Duo2:PlayFadeEffect(var_38_0, 0, 350, EA_MONOTONOUS_INCREASE)
	end
end

function OnPanelkaCheckbox_Duo2(arg_39_0)
	if arg_39_0.widget_Duo2:GetVariant() == 0 then
		arg_39_0.widget_Duo2:SetVariant(1)

		var_0_24.disable_buffs = false
	else
		arg_39_0.widget_Duo2:SetVariant(0)

		var_0_24.disable_buffs = true
	end

	SetConfig("config_Duo2", var_0_24)
	UnregisterAndClear_Duo2()
	RegisterAndCreate_Duo2()
end

function UnregisterAndClear_Duo2()
	var_0_7 = true

	if var_0_8 then
		common.UnRegisterEventHandler(eventBuffsElementChanged_Duo2, "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED")

		var_0_8 = nil
	end

	for iter_40_0, iter_40_1 in pairs(var_0_6) do
		if var_0_6[iter_40_0] then
			common.UnRegisterEventHandler(eventBuffsChanged_Duo2, "EVENT_OBJECT_BUFFS_CHANGED", var_0_6[iter_40_0])
			common.UnRegisterEventHandler(eventBuffsAdded_Duo2, "EVENT_OBJECT_BUFF_ADDED", var_0_6[iter_40_0])
		end
	end

	var_0_6 = {}
	var_0_21 = {}

	for iter_40_2, iter_40_3 in pairs(Buff_Duo2) do
		for iter_40_4, iter_40_5 in pairs(iter_40_3) do
			if Buff_Duo2[iter_40_2] and Buff_Duo2[iter_40_2][iter_40_4] then
				Buff_Duo2[iter_40_2][iter_40_4]:DestroyWidget()

				Buff_Duo2[iter_40_2][iter_40_4] = nil
			end
		end

		Buff_Duo2[iter_40_2] = nil
	end

	Buff_Duo2 = {}

	for iter_40_6, iter_40_7 in pairs(BuffMini_Duo2) do
		for iter_40_8, iter_40_9 in pairs(iter_40_7) do
			if BuffMini_Duo2[iter_40_6] and BuffMini_Duo2[iter_40_6][iter_40_8] then
				BuffMini_Duo2[iter_40_6][iter_40_8]:DestroyWidget()

				BuffMini_Duo2[iter_40_6][iter_40_8] = nil
			end
		end

		BuffMini_Duo2[iter_40_6] = nil
	end

	BuffMini_Duo2 = {}
end

function RegisterAndCreate_Duo2()
	if var_0_24.disable_buffs == false then
		for iter_41_0, iter_41_1 in pairs(avatar.GetUnitList()) do
			if iter_41_1 and object.IsExist(iter_41_1) and object.IsUnit(iter_41_1) then
				StartUpAddBuff_Duo2(iter_41_1)
			end

			var_0_6[iter_41_1] = {
				objectId = iter_41_1
			}

			common.RegisterEventHandler(eventBuffsChanged_Duo2, "EVENT_OBJECT_BUFFS_CHANGED", var_0_6[iter_41_1])
			common.RegisterEventHandler(eventBuffsAdded_Duo2, "EVENT_OBJECT_BUFF_ADDED", var_0_6[iter_41_1])
		end

		if var_0_8 == nil then
			common.RegisterEventHandler(eventBuffsElementChanged_Duo2, "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED")

			var_0_8 = true
		end
	end

	var_0_7 = false
end

function RezhimColor_Duo2()
	if var_0_24.Rezhim == 1 then
		PanelkaDND_Duo2:SetBackgroundColor({
			g = 0,
			a = 0.5,
			b = 0,
			r = 1
		})
	elseif var_0_24.Rezhim == 2 then
		PanelkaDND_Duo2:SetBackgroundColor({
			g = 0,
			a = 0.5,
			b = 1,
			r = 0
		})
	elseif var_0_24.Rezhim == 3 then
		PanelkaDND_Duo2:SetBackgroundColor({
			g = 1,
			a = 0.5,
			b = 0,
			r = 1
		})
	elseif var_0_24.Rezhim == 4 then
		PanelkaDND_Duo2:SetBackgroundColor({
			g = 0,
			a = 0.5,
			b = 0,
			r = 0
		})
	end
end

function OnXBtnReaction_Duo2(arg_43_0)
	ClosePanelka_Duo2()
end

function OnPageBuffsCheckBoxClick_Duo2(arg_44_0)
	local var_44_0 = true

	if arg_44_0.widget_Duo2:GetVariant() == 0 then
		arg_44_0.widget_Duo2:SetVariant(1)
	else
		arg_44_0.widget_Duo2:SetVariant(0)

		var_44_0 = false
	end

	local var_44_1 = arg_44_0.widget_Duo2:GetParent()
	local var_44_2 = tonumber(string.sub(var_44_1:GetName(), 7))

	if arg_44_0.sender == "CBUnit" then
		var_0_28[var_44_2].onUnits = var_44_0
	elseif arg_44_0.sender == "CBMobs" then
		var_0_28[var_44_2].onMobs = var_44_0
	end

	arg_44_0.widget_Duo2:SetFocus(true)
end

function RepaintContainer_Duo2()
	PageBuffsContainer_Duo2:RemoveItems()

	for iter_45_0, iter_45_1 in pairs(PageBuffsItems_Duo2) do
		PageBuffsItems_Duo2[iter_45_0]:DestroyWidget()

		PageBuffsItems_Duo2[iter_45_0] = nil
	end

	PageBuffsItems_Duo2 = {}

	if OptionsNew_Duo2:IsVisible() == true and GetTableSize_Duo2(var_0_28) > 0 then
		for iter_45_2 = 1, GetTableSize_Duo2(var_0_28) do
			PageBuffsItems_Duo2[iter_45_2] = mainForm:CreateWidgetByDesc(PageBuffsItemDesc_Duo2)

			PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("Text", false):SetVal("text", userMods.ToWString(var_0_28[iter_45_2].name))
			PageBuffsItems_Duo2[iter_45_2]:SetName("Items_" .. iter_45_2)

			if var_0_28[iter_45_2].onUnits == true then
				PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("CBUnit", false):SetVariant(1)
			else
				PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("CBUnit", false):SetVariant(0)
			end

			if var_0_28[iter_45_2].onMobs == true then
				PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("CBMobs", false):SetVariant(1)
			else
				PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("CBMobs", false):SetVariant(0)
			end

			if var_0_28[iter_45_2].icon and common.GetApiType(var_0_28[iter_45_2].icon) == "BuffId" then
				local var_45_0 = object.GetBuffInfo(var_0_28[iter_45_2].icon)

				if var_45_0.texture then
					PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("Icon", false):SetBackgroundTexture(var_45_0.texture)
				else
					PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("Icon", false):SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Icons", "UnknownBuff"))
				end
			else
				var_0_28[iter_45_2].icon = nil

				PageBuffsItems_Duo2[iter_45_2]:GetChildChecked("Icon", false):SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Icons", "UnknownBuff"))
			end

			PageBuffsItems_Duo2[iter_45_2]:Show(true)
			PageBuffsContainer_Duo2:PushBack(PageBuffsItems_Duo2[iter_45_2])
		end
	end
end

function ButtonEditClick_Duo2(arg_46_0)
	local var_46_0 = arg_46_0.widget_Duo2:GetParent()
	local var_46_1 = tonumber(string.sub(var_46_0:GetName(), 7))

	for iter_46_0, iter_46_1 in pairs(PageBuffsItems_Duo2) do
		iter_46_1:GetChildChecked("EditLine", false):Show(false)
		iter_46_1:GetChildChecked("EditLine", false):Enable(false)
		iter_46_1:GetChildChecked("Text", false):Show(true)
	end

	local var_46_2 = var_0_28[var_46_1].name

	var_46_0:GetChildChecked("Text", false):Show(false)
	var_46_0:GetChildChecked("EditLine", false):SetText(userMods.ToWString(var_46_2))
	var_46_0:GetChildChecked("EditLine", false):Show(true)
	var_46_0:GetChildChecked("EditLine", false):Enable(true)
	var_46_0:GetChildChecked("EditLine", false):SetFocus(true)
end

function RenameCancelReaction_Duo2(arg_47_0)
	local var_47_0 = arg_47_0.widget_Duo2:GetParent()
	local var_47_1 = tonumber(string.sub(var_47_0:GetName(), 7))

	arg_47_0.widget_Duo2:Show(false)
	arg_47_0.widget_Duo2:Enable(false)

	if var_0_28 and var_0_28[var_47_1] then
		local var_47_2 = var_0_28[var_47_1].name

		var_47_0:GetChildChecked("Text", false):SetVal("text", userMods.ToWString(var_47_2))
		var_47_0:GetChildChecked("Text", false):Show(true)
	end
end

function RenameBuildReaction_Duo2(arg_48_0)
	local var_48_0 = arg_48_0.widget_Duo2:GetParent()
	local var_48_1 = tonumber(string.sub(var_48_0:GetName(), 7))

	arg_48_0.widget_Duo2:Show(false)
	arg_48_0.widget_Duo2:Enable(false)

	local var_48_2 = arg_48_0.widget_Duo2:GetText()
	local var_48_3 = userMods.FromWString(var_48_2)

	for iter_48_0, iter_48_1 in pairs(var_0_28) do
		if iter_48_0 ~= var_48_1 and var_0_28[iter_48_0].name == var_48_3 then
			var_48_2 = userMods.ToWString("\xDD\xF2\xEE\xF2 \xE1\xE0\xF4 \xF3\xE6\xE5 \xF1\xF3\xF9\xE5\xF1\xF2\xE2\xF3\xE5\xF2!")
		end
	end

	if var_0_28[var_48_1].name ~= var_48_3 then
		var_0_28[var_48_1].icon = nil

		var_48_0:GetChildChecked("Icon", false):SetBackgroundTexture(common.GetAddonRelatedGroupTexture("Icons", "UnknownBuff"))
	end

	var_0_28[var_48_1].name = userMods.FromWString(var_48_2)

	var_48_0:GetChildChecked("Text", false):SetVal("text", var_48_2)
	var_48_0:GetChildChecked("Text", false):Show(true)
end

function RenameFocusChanged_Duo2(arg_49_0)
	if arg_49_0.widget_Duo2:IsFocused() ~= true then
		RenameBuildReaction_Duo2(arg_49_0)
	end
end

function ButtonDeleteClick_Duo2(arg_50_0)
	local var_50_0 = PageBuffsContainer_Duo2:GetContainerOffset()
	local var_50_1 = arg_50_0.widget_Duo2:GetParent()
	local var_50_2 = tonumber(string.sub(var_50_1:GetName(), 7))

	if var_50_2 < GetTableSize_Duo2(var_0_28) then
		for iter_50_0 = var_50_2, GetTableSize_Duo2(var_0_28) - 1 do
			var_0_28[iter_50_0] = var_0_28[iter_50_0 + 1]
		end
	end

	var_0_28[GetTableSize_Duo2(var_0_28)] = nil

	RepaintContainer_Duo2()
	PageBuffsContainer_Duo2:SetContainerOffset(var_50_0)
end

function NewItem_Duo2()
	if var_0_27 == true then
		var_0_28[GetTableSize_Duo2(var_0_28) + 1] = {
			onUnits = false,
			onMobs = false,
			name = "\xCD\xEE\xE2\xFB\xE9 \xE1\xE0\xF4\xF4 " .. common.GetRandInt(1000, 9999)
		}

		RepaintContainer_Duo2()
		PageBuffsContainer_Duo2:ForceReposition()
		PageBuffsContainer_Duo2:SetContainerOffset(PageBuffsContainer_Duo2:GetMaxContainerOffset())

		local var_51_0 = {
			widget_Duo2 = PageBuffsItems_Duo2[GetTableSize_Duo2(var_0_28)]:GetChildChecked("ButtonEdit", false)
		}

		ButtonEditClick_Duo2(var_51_0)
	end
end

function MovePage_Duo2(arg_52_0, arg_52_1)
	local var_52_0 = 200
	local var_52_1 = arg_52_0:GetPlacementPlain()
	local var_52_2 = arg_52_0:GetPlacementPlain()

	var_52_2.posX = arg_52_1.posX or var_52_2.posX
	var_52_2.posY = arg_52_1.posY or var_52_2.posY

	arg_52_0:FinishMoveEffect()
	arg_52_0:PlayMoveEffect(var_52_1, var_52_2, var_52_0, EA_MONOTONOUS_INCREASE)
end

function OnSelectPage_Duo2(arg_53_0)
	if arg_53_0.sender == "Page1" then
		MovePage_Duo2(PageBuffs_Duo2, {
			posX = 0
		})
		MovePage_Duo2(PageOpts_Duo2, {
			posX = 680
		})
		MovePage_Duo2(PageMark_Duo2, {
			posX = 1360
		})
		MovePage_Duo2(FabButton_Duo2, {
			posY = 64
		})

		var_0_27 = true

		FabButton_Duo2:FinishFadeEffect()
		FabButton_Duo2:PlayFadeEffect(FabButton_Duo2:GetFade(), 1, 200, EA_MONOTONOUS_INCREASE)
		MovePage_Duo2(PageSelector_Duo2, {
			posX = 0
		})
	elseif arg_53_0.sender == "Page2" then
		MovePage_Duo2(PageBuffs_Duo2, {
			posX = -680
		})
		MovePage_Duo2(PageOpts_Duo2, {
			posX = 0
		})
		MovePage_Duo2(PageMark_Duo2, {
			posX = 680
		})
		MovePage_Duo2(FabButton_Duo2, {
			posY = 0
		})

		var_0_27 = false

		FabButton_Duo2:FinishFadeEffect()
		FabButton_Duo2:PlayFadeEffect(FabButton_Duo2:GetFade(), 0, 200, EA_MONOTONOUS_INCREASE)
		MovePage_Duo2(PageSelector_Duo2, {
			posX = 150
		})
	elseif arg_53_0.sender == "Page3" then
		MovePage_Duo2(PageBuffs_Duo2, {
			posX = -1360
		})
		MovePage_Duo2(PageOpts_Duo2, {
			posX = -680
		})
		MovePage_Duo2(PageMark_Duo2, {
			posX = 0
		})
		MovePage_Duo2(FabButton_Duo2, {
			posY = 0
		})

		var_0_27 = false

		FabButton_Duo2:FinishFadeEffect()
		FabButton_Duo2:PlayFadeEffect(FabButton_Duo2:GetFade(), 0, 200, EA_MONOTONOUS_INCREASE)
		MovePage_Duo2(PageSelector_Duo2, {
			posX = 300
		})
	end
end

function OnRBtnReaction_Duo2(arg_54_0)
	local var_54_0 = not OptionsNew_Duo2:IsVisible()

	OptionsNew_Duo2:Show(var_54_0)
	RepaintContainer_Duo2()

	if var_54_0 ~= true then
		var_0_29 = nil
		var_0_29 = {}
		var_0_30 = nil
		var_0_30 = {}

		for iter_54_0, iter_54_1 in pairs(var_0_28) do
			if iter_54_1.onUnits == true then
				var_0_29[iter_54_1.name] = {}
				var_0_29[iter_54_1.name].id = iter_54_0
				var_0_29[iter_54_1.name].icon = iter_54_1.icon
			end

			if iter_54_1.onMobs == true then
				var_0_30[iter_54_1.name] = {}
				var_0_30[iter_54_1.name].id = iter_54_0
				var_0_30[iter_54_1.name].icon = iter_54_1.icon
			end
		end

		if FlagMark_Duo2:GetVariant() == 1 then
			var_0_24.show_mark = true
		else
			var_0_24.show_mark = false
		end

		UnregisterAndClear_Duo2()
		RegisterAndCreate_Duo2()
		eventAvatarTargetChanged_Duo2()
		SetConfig("config_Duo2", var_0_24)
		SetConfig("DataBase70_Duo2", var_0_28)
	else
		if var_0_24.show_mark == true then
			FlagMark_Duo2:SetVariant(1)
		else
			FlagMark_Duo2:SetVariant(0)
		end

		for iter_54_2, iter_54_3 in pairs(ContainerItems_Duo2) do
			iter_54_3:SetVariant(0)

			if iter_54_2 == var_0_24.current_target then
				iter_54_3:SetVariant(1)
				SetPreview_Duo2(iter_54_2)
			end
		end
	end
end

function OnSBtnReaction_Duo2(arg_55_0)
	var_0_1:Show(false)

	if var_0_24.multi_columns == false then
		var_0_24.multi_columns = true
	else
		var_0_24.multi_columns = false
	end

	UpdateUnitBarXY_Duo2()
	SetConfig("config_Duo2", var_0_24)
	PrepareList_Duo2()
	CollectUnits_Duo2()
end

function UpdateUnitBarXY_Duo2()
	if var_0_24.multi_columns == false then
		var_0_22 = var_0_24.singleBarX
		var_0_23 = var_0_24.singleBarY
	else
		var_0_22 = var_0_24.multiBarX
		var_0_23 = var_0_24.multiBarY
	end
end

function OnMBtnReaction_Duo2(arg_57_0)
	if SelectMode_Duo2:IsVisible() then
		SelectMode_Duo2:Show(false)
	else
		local var_57_0 = MainPanel_Duo2:GetPlacementPlain()

		MoveWidget_Duo2(SelectMode_Duo2, {
			posX = var_57_0.posX - 85,
			posY = var_57_0.posY + 25
		})
		SelectMode_Duo2:Show(true)
	end
end

function OnSelectMode_Duo2(arg_58_0)
	local var_58_0 = tonumber(string.sub(arg_58_0.widget_Duo2:GetName(), 7))

	UnregisterAndClear_Duo2()
	var_0_1:Show(false)

	var_0_24.Rezhim = var_58_0

	RezhimColor_Duo2()
	SetConfig("config_Duo2", var_0_24)
	RegisterAndCreate_Duo2()
	PrepareList_Duo2()
	CollectUnits_Duo2()
	SelectMode_Duo2:Show(false)
end

function SetOptionWidget_Duo2(arg_59_0)
	if arg_59_0.type == "label" then
		arg_59_0.widget_Duo2:GetChildChecked("Text", false):SetVal("text", userMods.ToWString(arg_59_0.text))
	elseif arg_59_0.type == "checkbox" then
		arg_59_0.widget_Duo2:GetChildChecked("Text", false):SetVal("text", userMods.ToWString(arg_59_0.text))

		if var_0_24[arg_59_0.param1] == true then
			arg_59_0.widget_Duo2:GetChildChecked("CheckBoxButton", false):SetVariant(1)
		else
			arg_59_0.widget_Duo2:GetChildChecked("CheckBoxButton", false):SetVariant(0)
		end
	elseif arg_59_0.type == "selector" then
		arg_59_0.widget_Duo2:GetChildChecked("Text", false):SetVal("text", userMods.ToWString(arg_59_0.text))

		if not arg_59_0.param2 then
			arg_59_0.widget_Duo2:GetChildChecked("Counter", false):SetVal("text", common.FormatInt(var_0_24[arg_59_0.param1], "%d"))
		else
			arg_59_0.widget_Duo2:GetChildChecked("Counter", false):SetVal("text", common.FormatInt(var_0_24[arg_59_0.param1][arg_59_0.param2], "%d"))
		end
	elseif arg_59_0.type == "button" then
		arg_59_0.widget_Duo2:GetChildChecked("Button", false):GetChildChecked("Text", false):SetVal("text", userMods.ToWString(arg_59_0.text))
	end
end

function AddOptionLabel_Duo2(arg_60_0)
	OptionBase_Duo2[arg_60_0.name] = {}
	OptionBase_Duo2[arg_60_0.name].widget_Duo2 = mainForm:CreateWidgetByDesc(OptionLabelDesc_Duo2)

	OptionBase_Duo2[arg_60_0.name].widget_Duo2:SetName(arg_60_0.name)

	OptionBase_Duo2[arg_60_0.name].text = arg_60_0.text
	OptionBase_Duo2[arg_60_0.name].type = "label"

	SetOptionWidget_Duo2(OptionBase_Duo2[arg_60_0.name])
	OptionBase_Duo2[arg_60_0.name].widget_Duo2:Show(true)
	PageOptsContainer_Duo2:PushBack(OptionBase_Duo2[arg_60_0.name].widget_Duo2)
end

function AddOptionCheckBox_Duo2(arg_61_0)
	OptionBase_Duo2[arg_61_0.name] = {}
	OptionBase_Duo2[arg_61_0.name].widget_Duo2 = mainForm:CreateWidgetByDesc(OptionCheckBoxDesc_Duo2)

	OptionBase_Duo2[arg_61_0.name].widget_Duo2:SetName(arg_61_0.name)

	OptionBase_Duo2[arg_61_0.name].text = arg_61_0.text
	OptionBase_Duo2[arg_61_0.name].func = arg_61_0.func
	OptionBase_Duo2[arg_61_0.name].param1 = arg_61_0.param1
	OptionBase_Duo2[arg_61_0.name].type = "checkbox"

	SetOptionWidget_Duo2(OptionBase_Duo2[arg_61_0.name])
	OptionBase_Duo2[arg_61_0.name].widget_Duo2:Show(true)
	PageOptsContainer_Duo2:PushBack(OptionBase_Duo2[arg_61_0.name].widget_Duo2)
end

function AddOptionSelector_Duo2(arg_62_0)
	OptionBase_Duo2[arg_62_0.name] = {}
	OptionBase_Duo2[arg_62_0.name].widget_Duo2 = mainForm:CreateWidgetByDesc(OptionSelectorDesc_Duo2)

	OptionBase_Duo2[arg_62_0.name].widget_Duo2:SetName(arg_62_0.name)

	OptionBase_Duo2[arg_62_0.name].text = arg_62_0.text
	OptionBase_Duo2[arg_62_0.name].func = arg_62_0.func
	OptionBase_Duo2[arg_62_0.name].minm = arg_62_0.minm
	OptionBase_Duo2[arg_62_0.name].maxm = arg_62_0.maxm
	OptionBase_Duo2[arg_62_0.name].step = arg_62_0.step
	OptionBase_Duo2[arg_62_0.name].param1 = arg_62_0.param1
	OptionBase_Duo2[arg_62_0.name].param2 = arg_62_0.param2
	OptionBase_Duo2[arg_62_0.name].type = "selector"

	SetOptionWidget_Duo2(OptionBase_Duo2[arg_62_0.name])
	OptionBase_Duo2[arg_62_0.name].widget_Duo2:Show(true)
	PageOptsContainer_Duo2:PushBack(OptionBase_Duo2[arg_62_0.name].widget_Duo2)
end

function AddOptionButton_Duo2(arg_63_0)
	OptionBase_Duo2[arg_63_0.name] = {}
	OptionBase_Duo2[arg_63_0.name].widget_Duo2 = mainForm:CreateWidgetByDesc(OptionButtonDesc_Duo2)

	OptionBase_Duo2[arg_63_0.name].widget_Duo2:SetName(arg_63_0.name)

	OptionBase_Duo2[arg_63_0.name].text = arg_63_0.text
	OptionBase_Duo2[arg_63_0.name].func = arg_63_0.func
	OptionBase_Duo2[arg_63_0.name].type = "button"

	SetOptionWidget_Duo2(OptionBase_Duo2[arg_63_0.name])
	OptionBase_Duo2[arg_63_0.name].widget_Duo2:Show(true)
	PageOptsContainer_Duo2:PushBack(OptionBase_Duo2[arg_63_0.name].widget_Duo2)
end

function PrepareOptions_Duo2()
	AddOptionLabel_Duo2({
		name = "lbl1",
		text = L_Duo2("LabelCommon")
	})
	AddOptionCheckBox_Duo2({
		name = "chk0",
		param1 = "show_arrow",
		text = L_Duo2("ShowArrow"),
		func = function()
			eventAvatarTargetChanged_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk1",
		param1 = "show_gear",
		text = L_Duo2("ShowGear"),
		func = function()
			ShowGearChanged_Duo2()
			eventAvatarTargetChanged_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk2",
		param1 = "hide_green",
		text = L_Duo2("HideGreen"),
		func = function()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk3",
		param1 = "show_pets",
		text = L_Duo2("ShowPets"),
		func = function()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 1,
		name = "slc0",
		param1 = "maxRows",
		maxm = 24,
		step = 1,
		text = L_Duo2("MaxRows"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk10",
		param1 = "show_mini",
		text = L_Duo2("ShowMini"),
		func = function()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk4",
		param1 = "show_ownbuffs",
		text = L_Duo2("OwnBuffs")
	})
	AddOptionCheckBox_Duo2({
		name = "chk5",
		param1 = "show_mobbuffs",
		text = L_Duo2("MobBuffs")
	})
	AddOptionCheckBox_Duo2({
		name = "chk11",
		param1 = "inverseSort",
		text = L_Duo2("InverseSort"),
		func = function()
			CollectUnits_Duo2()
		end
	})
	AddOptionLabel_Duo2({
		name = "lbl2",
		text = L_Duo2("LabelSingle")
	})
	AddOptionSelector_Duo2({
		minm = 100,
		name = "slc1",
		param1 = "singleBarX",
		maxm = 300,
		step = 2,
		text = L_Duo2("PanelWidth"),
		func = function()
			UpdateUnitBarXY_Duo2()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 20,
		name = "slc2",
		param1 = "singleBarY",
		maxm = 50,
		step = 1,
		text = L_Duo2("PanelHeight"),
		func = function()
			UpdateUnitBarXY_Duo2()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 12,
		name = "slc3",
		param1 = "singleFontSize",
		maxm = 30,
		step = 1,
		text = L_Duo2("PanelFontSize"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 18,
		name = "slc31",
		param1 = "singleIconSize",
		maxm = 48,
		step = 1,
		text = L_Duo2("PanelIconSize"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk6",
		param1 = "singleShadow",
		text = L_Duo2("PanelShadow"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk7",
		param1 = "singleOutline",
		text = L_Duo2("PanelOutline"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionLabel_Duo2({
		name = "lbl3",
		text = L_Duo2("LabelMulti")
	})
	AddOptionSelector_Duo2({
		minm = 100,
		name = "slc4",
		param1 = "multiBarX",
		maxm = 300,
		step = 2,
		text = L_Duo2("PanelWidth"),
		func = function()
			UpdateUnitBarXY_Duo2()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 20,
		name = "slc5",
		param1 = "multiBarY",
		maxm = 50,
		step = 1,
		text = L_Duo2("PanelHeight"),
		func = function()
			UpdateUnitBarXY_Duo2()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 12,
		name = "slc6",
		param1 = "multiFontSize",
		maxm = 30,
		step = 1,
		text = L_Duo2("PanelFontSize"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		minm = 18,
		name = "slc32",
		param1 = "multiIconSize",
		maxm = 48,
		step = 1,
		text = L_Duo2("PanelIconSize"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk8",
		param1 = "multiShadow",
		text = L_Duo2("PanelShadow"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionCheckBox_Duo2({
		name = "chk9",
		param1 = "multiOutline",
		text = L_Duo2("PanelOutline"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionLabel_Duo2({
		name = "lbl5",
		text = L_Duo2("LabelPriority")
	})
	AddOptionSelector_Duo2({
		param2 = "WARRIOR",
		name = "slc7",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("WARRIOR"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PALADIN",
		name = "slc8",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("PALADIN"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "MAGE",
		name = "slc9",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("MAGE"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "DRUID",
		name = "slc10",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("DRUID"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PSIONIC",
		name = "slc11",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("PSIONIC"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "STALKER",
		name = "slc12",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("STALKER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PRIEST",
		name = "slc13",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("PRIEST"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "NECROMANCER",
		name = "slc14",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("NECROMANCER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "BARD",
		name = "slc15",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("BARD"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "ENGINEER",
		name = "slc16",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("ENGINEER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "WARLOCK",
		name = "slc29",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("WARLOCK"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PET",
		name = "slc17",
		param1 = "priority",
		minm = 1,
		maxm = 12,
		step = 1,
		text = L_Duo2("PET"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionLabel_Duo2({
		name = "lbl6",
		text = L_Duo2("LabelPosition")
	})
	AddOptionSelector_Duo2({
		param2 = "WARRIOR",
		name = "slc18",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("WARRIOR"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PALADIN",
		name = "slc19",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("PALADIN"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "MAGE",
		name = "slc20",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("MAGE"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "DRUID",
		name = "slc21",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("DRUID"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PSIONIC",
		name = "slc22",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("PSIONIC"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "STALKER",
		name = "slc23",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("STALKER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PRIEST",
		name = "slc24",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("PRIEST"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "NECROMANCER",
		name = "slc25",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("NECROMANCER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "BARD",
		name = "slc26",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("BARD"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "ENGINEER",
		name = "slc27",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("ENGINEER"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "WARLOCK",
		name = "slc30",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("WARLOCK"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionSelector_Duo2({
		param2 = "PET",
		name = "slc28",
		param1 = "column",
		minm = 1,
		maxm = 4,
		step = 1,
		text = L_Duo2("PET"),
		func = function()
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
	})
	AddOptionButton_Duo2({
		name = "btn1",
		text = L_Duo2("ResetConfig"),
		func = function()
			DefaultConfig_Duo2()
		end
	})
	AddOptionButton_Duo2({
		name = "btn2",
		text = L_Duo2("ExportBuffs"),
		func = function()
			ExportBuffs_Duo2()
		end
	})
	AddOptionButton_Duo2({
		name = "btn3",
		text = L_Duo2("ResetBuffs"),
		func = function()
			DefaultBuffs_Duo2()
		end
	})
end

function ShowGearChanged_Duo2()
	if var_0_24.show_gear ~= true then
		var_0_2:Show(false)
		var_0_3:Show(false)
		var_0_4:Show(false)
	end
end

function OnCheckBoxClick_Duo2(arg_112_0)
	if arg_112_0.widget_Duo2:GetVariant() == 0 then
		arg_112_0.widget_Duo2:SetVariant(1)
	else
		arg_112_0.widget_Duo2:SetVariant(0)
	end
end

function OnOptionButton_Duo2(arg_113_0)
	local var_113_0 = arg_113_0.widget_Duo2:GetParent():GetName()

	if OptionBase_Duo2[var_113_0] and OptionBase_Duo2[var_113_0].func then
		OptionBase_Duo2[var_113_0].func()
	end
end

function OnOptionCheckBox_Duo2(arg_114_0)
	local var_114_0 = arg_114_0.widget_Duo2:GetParent():GetName()

	if OptionBase_Duo2[var_114_0] then
		if var_0_24[OptionBase_Duo2[var_114_0].param1] == true then
			var_0_24[OptionBase_Duo2[var_114_0].param1] = false
		else
			var_0_24[OptionBase_Duo2[var_114_0].param1] = true
		end

		SetOptionWidget_Duo2(OptionBase_Duo2[var_114_0])

		if OptionBase_Duo2[var_114_0].func then
			OptionBase_Duo2[var_114_0].func()
		end
	end
end

function OnOptionNext_Duo2(arg_115_0)
	local var_115_0 = arg_115_0.widget_Duo2:GetParent():GetName()

	if OptionBase_Duo2[var_115_0] then
		if not OptionBase_Duo2[var_115_0].param2 then
			local var_115_1 = var_0_24[OptionBase_Duo2[var_115_0].param1]

			if var_115_1 < OptionBase_Duo2[var_115_0].maxm then
				local var_115_2 = math.min(var_115_1 + OptionBase_Duo2[var_115_0].step, OptionBase_Duo2[var_115_0].maxm)

				var_0_24[OptionBase_Duo2[var_115_0].param1] = var_115_2

				SetOptionWidget_Duo2(OptionBase_Duo2[var_115_0])

				if OptionBase_Duo2[var_115_0].func then
					OptionBase_Duo2[var_115_0].func()
				end
			end
		else
			local var_115_3 = var_0_24[OptionBase_Duo2[var_115_0].param1][OptionBase_Duo2[var_115_0].param2]

			if var_115_3 < OptionBase_Duo2[var_115_0].maxm then
				local var_115_4 = math.min(var_115_3 + OptionBase_Duo2[var_115_0].step, OptionBase_Duo2[var_115_0].maxm)

				var_0_24[OptionBase_Duo2[var_115_0].param1][OptionBase_Duo2[var_115_0].param2] = var_115_4

				SetOptionWidget_Duo2(OptionBase_Duo2[var_115_0])

				if OptionBase_Duo2[var_115_0].func then
					OptionBase_Duo2[var_115_0].func()
				end
			end
		end
	end
end

function OnOptionPrev_Duo2(arg_116_0)
	local var_116_0 = arg_116_0.widget_Duo2:GetParent():GetName()

	if OptionBase_Duo2[var_116_0] then
		if not OptionBase_Duo2[var_116_0].param2 then
			local var_116_1 = var_0_24[OptionBase_Duo2[var_116_0].param1]

			if var_116_1 > OptionBase_Duo2[var_116_0].minm then
				local var_116_2 = math.max(var_116_1 - OptionBase_Duo2[var_116_0].step, OptionBase_Duo2[var_116_0].minm)

				var_0_24[OptionBase_Duo2[var_116_0].param1] = var_116_2

				SetOptionWidget_Duo2(OptionBase_Duo2[var_116_0])

				if OptionBase_Duo2[var_116_0].func then
					OptionBase_Duo2[var_116_0].func()
				end
			end
		else
			local var_116_3 = var_0_24[OptionBase_Duo2[var_116_0].param1][OptionBase_Duo2[var_116_0].param2]

			if var_116_3 > OptionBase_Duo2[var_116_0].minm then
				local var_116_4 = math.max(var_116_3 - OptionBase_Duo2[var_116_0].step, OptionBase_Duo2[var_116_0].minm)

				var_0_24[OptionBase_Duo2[var_116_0].param1][OptionBase_Duo2[var_116_0].param2] = var_116_4

				SetOptionWidget_Duo2(OptionBase_Duo2[var_116_0])

				if OptionBase_Duo2[var_116_0].func then
					OptionBase_Duo2[var_116_0].func()
				end
			end
		end
	end
end

function OnReactionShowHideBtnReaction_Duo2()
	if DnD.IsDragging() then
		return
	end

	ClosePanelka_Duo2()
end

function ClosePanelka_Duo2()
	if var_0_24.show_panel == true then
		var_0_24.show_panel = false
	else
		var_0_24.show_panel = true
		PrepareList_Duo2()
		CollectUnits_Duo2()
	end
	MainPanel_Duo2:Show(var_0_24.show_panel)
	SetConfig("config_Duo2", var_0_24)
end

function Duo2_OnDuoVisibilityChanged(params)
	if not params or params.show == nil then return end
	local show = params.show == true
	if var_0_24.show_panel ~= show then
		var_0_24.show_panel = show
		if show then
			PrepareList_Duo2()
			CollectUnits_Duo2()
		end
		MainPanel_Duo2:Show(show)
		SetConfig("config_Duo2", var_0_24)
	end
end

function AOPanelStart_Duo2(arg_119_0)
	local var_119_0 = mainForm:GetChildChecked("AOPanel", false)
	local var_119_1 = {
		val = userMods.ToWString("B2")
	}
	local var_119_2 = {
		ptype = "button",
		size = 22,
		header = var_119_1,
		icon = var_119_0
	}

	userMods.SendEvent("AOPANEL_SEND_ADDON", {
		name = "BuffAnnounce2",
		sysName = "BuffAnnounce2",
		param = var_119_2
	})
	ShowHideBtn_Duo2:Show(false)
	MoveWidget_Duo2(var_0_2, {
		posY = 30
	})
	MoveWidget_Duo2(var_0_3, {
		posY = 50
	})
	MoveWidget_Duo2(var_0_4, {
		posY = 70
	})
end

function AOPanelLMB_Duo2(arg_120_0)
	if arg_120_0.sender == "BuffAnnounce2" then
		OnReactionShowHideBtnReaction_Duo2()
	end
end

function PrepareConfig_Duo2()
	if var_0_24.show_mark == nil then
		var_0_24.show_mark = true
	end

	if var_0_24.show_arrow == nil then
		var_0_24.show_arrow = true
	end

	if var_0_24.show_gear == nil then
		var_0_24.show_gear = true
	end

	if var_0_24.show_ownbuffs == nil then
		var_0_24.show_ownbuffs = true
	end

	if var_0_24.hide_green == nil then
		var_0_24.hide_green = true
	end

	if var_0_24.show_pets == nil then
		var_0_24.show_pets = true
	end

	if var_0_24.disable_buffs == nil then
		var_0_24.disable_buffs = false
	end

	if var_0_24.show_mobbuffs == nil then
		var_0_24.show_mobbuffs = true
	end

	if var_0_24.current_target == nil then
		var_0_24.current_target = 1
	end

	if var_0_24.inverseSort == nil then
		var_0_24.inverseSort = false
	end

	if var_0_24.singleIconSize == nil then
		var_0_24.singleIconSize = 18
	end

	if var_0_24.multiIconSize == nil then
		var_0_24.multiIconSize = 18
	end

	if var_0_24.singleBarX == nil then
		var_0_24.singleBarX = 170
	end

	if var_0_24.singleBarY == nil then
		var_0_24.singleBarY = 20
	end

	if var_0_24.singleFontSize == nil then
		var_0_24.singleFontSize = 14
	end

	if var_0_24.singleShadow == nil then
		var_0_24.singleShadow = true
	end

	if var_0_24.singleOutline == nil then
		var_0_24.singleOutline = true
	end

	if var_0_24.multiBarX == nil then
		var_0_24.multiBarX = 120
	end

	if var_0_24.multiBarY == nil then
		var_0_24.multiBarY = 20
	end

	if var_0_24.multiFontSize == nil then
		var_0_24.multiFontSize = 14
	end

	if var_0_24.multiShadow == nil then
		var_0_24.multiShadow = true
	end

	if var_0_24.multiOutline == nil then
		var_0_24.multiOutline = true
	end

	if var_0_24.maxRows == nil then
		var_0_24.maxRows = 24
	end

	if var_0_24.show_mini == nil then
		var_0_24.show_mini = true
	end

	if var_0_24.show_panel == nil then
		var_0_24.show_panel = true
	end

	if var_0_24.Rezhim == nil then
		var_0_24.Rezhim = 1
	end

	if var_0_24.multi_columns == nil then
		var_0_24.multi_columns = false
	end

	if var_0_24.priority == nil then
		var_0_24.priority = {
			PSIONIC = 6,
			DRUID = 9,
			PRIEST = 11,
			BARD = 4,
			PET = 1,
			STALKER = 5,
			NECROMANCER = 10,
			ENGINEER = 7,
			PALADIN = 2,
			WARRIOR = 3,
			MAGE = 8
		}
	end

	if not var_0_24.priority.WARLOCK then
		var_0_24.priority.WARLOCK = 12
	end

	if var_0_24.column == nil then
		var_0_24.column = {
			PSIONIC = 2,
			DRUID = 2,
			PRIEST = 3,
			BARD = 2,
			PET = 4,
			STALKER = 3,
			NECROMANCER = 1,
			ENGINEER = 1,
			PALADIN = 1,
			WARRIOR = 3,
			MAGE = 2
		}
	end

	if not var_0_24.column.WARLOCK then
		var_0_24.column.WARLOCK = 1
	end
end

function DefaultConfig_Duo2()
	var_0_24 = {}

	PrepareConfig_Duo2()

	for iter_122_0, iter_122_1 in pairs(OptionBase_Duo2) do
		SetOptionWidget_Duo2(iter_122_1)
	end

	ShowGearChanged_Duo2()
	eventAvatarTargetChanged_Duo2()
	UpdateUnitBarXY_Duo2()
	PrepareList_Duo2()
	CollectUnits_Duo2()
end

function DefaultBuffs_Duo2()
	var_0_28 = nil
	var_0_28 = {}

	local var_123_0 = 1

	for iter_123_0, iter_123_1 in ipairs(DataBaseDefault) do
		var_0_28[var_123_0] = {}
		var_0_28[var_123_0].name = DataBaseDefault[iter_123_0].name
		var_0_28[var_123_0].onUnits = DataBaseDefault[iter_123_0].onUnits
		var_0_28[var_123_0].onMobs = DataBaseDefault[iter_123_0].onMobs
		var_0_28[var_123_0].icon = DataBaseDefault[iter_123_0].icon
		var_123_0 = var_123_0 + 1
	end

	RepaintContainer_Duo2()
end

function ExportBuffs_Duo2()
	local var_124_0 = "\n\n-- \xC2\xF1\xF2\xE0\xE2\xFC\xF2\xE5 \xF1\xEB\xE5\xE4\xF3\xFE\xF9\xE8\xE9 \xF2\xE5\xEA\xF1\xF2 \xE2 \xF4\xE0\xE9\xEB DataBaseDefault.txt \xE2 \xEF\xE0\xEF\xEA\xE5 \xE0\xE4\xE4\xEE\xED\xE0, \xE5\xF1\xEB\xE8 \xF5\xEE\xF2\xE8\xF2\xE5 \xE7\xE0\xE3\xF0\xF3\xE6\xE0\xF2\xFC \xFD\xF2\xEE\xF2 \xF1\xEF\xE8\xF1\xEE\xEA \xE1\xE0\xF4\xEE\xE2 \xEF\xF0\xE8 \xF1\xE1\xF0\xEE\xF1\xE5\n" .. "-- \xC7\xE0\xF2\xE5\xEC \xE2 \xE8\xE3\xF0\xE5 \xEF\xE5\xF0\xE5\xE7\xE0\xE3\xF0\xF3\xE7\xE8\xF2\xE5 \xE0\xE4\xE4\xEE\xED \xE8 \xF1\xE4\xE5\xEB\xE0\xE9\xF2\xE5 \xF1\xE1\xF0\xEE\xF1 \xF1\xEF\xE8\xF1\xEA\xE0 \xE1\xE0\xF4\xEE\xE2 \xE2 \xED\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE0\xF5 \xE0\xE4\xE4\xEE\xED\xE0\n\nGlobal(\"DataBaseDefault\", {\n"

	for iter_124_0, iter_124_1 in ipairs(var_0_28) do
		local var_124_1 = iter_124_1.onUnits == true and "true" or "false"
		local var_124_2 = iter_124_1.onMobs == true and "true" or "false"

		var_124_0 = var_124_0 .. "\t[" .. iter_124_0 .. "] = { name = \"" .. iter_124_1.name .. "\"; onUnits = " .. var_124_1 .. "; onMobs = " .. var_124_2 .. " },\n"
	end

	local var_124_3 = var_124_0 .. "})"

	common.LogInfo("common", var_124_3)
end

function Init_Duo2()
	mainForm:Show(true)

	if not var_0_24 then
		var_0_24 = {}
	end

	PrepareConfig_Duo2()
	local primaryConfig = GetConfig("config")
	if primaryConfig and primaryConfig.show_panel ~= nil then
		var_0_24.show_panel = primaryConfig.show_panel
	end
	SetConfig("config_Duo2", var_0_24)
	MainPanel_Duo2:SetBackgroundColor({
		g = 0,
		a = 0,
		b = 0,
		r = 0
	})
	MainPanel_Duo2:Show(var_0_24.show_panel)
	FadePanel_Duo2:SetBackgroundColor({
		g = 0,
		a = 1,
		b = 0,
		r = 0
	})
	FadePanel_Duo2:SetFade(0)
	RezhimColor_Duo2()

	var_0_22 = var_0_24.singleBarX
	var_0_23 = var_0_24.singleBarY

	if var_0_24.multi_columns == true then
		var_0_22 = var_0_24.multiBarX
		var_0_23 = var_0_24.multiBarY
	end

	if var_0_24.disable_buffs == true then
		PanelkaDND_Duo2:GetChildChecked("Checkbox", false):SetVariant(0)
	else
		PanelkaDND_Duo2:GetChildChecked("Checkbox", false):SetVariant(1)
	end

	if GS.Init_Duo2 then
		GS.Init_Duo2()
	end

	GS.EnableTargetInspection(false)

	var_0_17 = GetGameLocalization_Duo2()
	var_0_18 = L_Duo2("ss")
	var_0_19 = L_Duo2("mm")
	var_0_20 = L_Duo2("hh")
	var_0_29 = {}
	var_0_30 = {}

	if var_0_28 == nil then
		var_0_28 = {}

		local var_125_0 = 1

		for iter_125_0, iter_125_1 in ipairs(DataBaseDefault) do
			var_0_28[var_125_0] = {}
			var_0_28[var_125_0].name = DataBaseDefault[iter_125_0].name
			var_0_28[var_125_0].onUnits = DataBaseDefault[iter_125_0].onUnits
			var_0_28[var_125_0].onMobs = DataBaseDefault[iter_125_0].onMobs
			var_0_28[var_125_0].icon = DataBaseDefault[iter_125_0].icon
			var_125_0 = var_125_0 + 1
		end
	end

	for iter_125_2, iter_125_3 in pairs(var_0_28) do
		if iter_125_3.onUnits == true then
			var_0_29[iter_125_3.name] = {}
			var_0_29[iter_125_3.name].id = iter_125_2
			var_0_29[iter_125_3.name].icon = iter_125_3.icon
		end

		if iter_125_3.onMobs == true then
			var_0_30[iter_125_3.name] = {}
			var_0_30[iter_125_3.name].id = iter_125_2
			var_0_30[iter_125_3.name].icon = iter_125_3.icon
		end
	end

	var_0_2:Show(false)
	var_0_3:Show(false)
	var_0_4:Show(false)
	widget_Duo2:Show(false)
	widgetMini_Duo2:Show(false)
	var_0_1:Show(false)
	Header_Duo2:GetChildChecked("Page1", false):GetChildChecked("PageText", false):SetVal("text", userMods.ToWString(L_Duo2("PageBuffs")))
	Header_Duo2:GetChildChecked("Page2", false):GetChildChecked("PageText", false):SetVal("text", userMods.ToWString(L_Duo2("PageOpts")))
	Header_Duo2:GetChildChecked("Page3", false):GetChildChecked("PageText", false):SetVal("text", userMods.ToWString(L_Duo2("PageMark")))
	PageBuffs_Duo2:GetChildChecked("LabelBuffName", false):SetVal("text", userMods.ToWString(L_Duo2("BuffName")))
	PageBuffs_Duo2:GetChildChecked("LabelOnUnit", false):SetVal("text", userMods.ToWString(L_Duo2("OnUnit")))
	PageBuffs_Duo2:GetChildChecked("LabelOnMobs", false):SetVal("text", userMods.ToWString(L_Duo2("OnMobs")))
	PageMark_Duo2:GetChildChecked("ItemShowMark", false):GetChildChecked("Text", false):SetVal("text", userMods.ToWString(L_Duo2("ShowMark")))
	SelectMode_Duo2:GetChildChecked("Name1", false):SetVal("Name", userMods.ToWString(L_Duo2("Enemies")))
	SelectMode_Duo2:GetChildChecked("Name2", false):SetVal("Name", userMods.ToWString(L_Duo2("Friends")))
	SelectMode_Duo2:GetChildChecked("Name3", false):SetVal("Name", userMods.ToWString(L_Duo2("Mobs")))
	SelectMode_Duo2:GetChildChecked("Name4", false):SetVal("Name", userMods.ToWString(L_Duo2("Spectator")))

	for iter_125_4 = 1, 4 do
		UnitBars_Duo2[iter_125_4] = {}
		UnitButtons_Duo2[iter_125_4] = {}
		Icons_Duo2[iter_125_4] = {}
		Names_Duo2[iter_125_4] = {}
		Levels_Duo2[iter_125_4] = {}
		Backgrounds_Duo2[iter_125_4] = {}
		Foregrounds_Duo2[iter_125_4] = {}
		Bubbles_Duo2[iter_125_4] = {}

		for iter_125_5 = 1, 24 do
			UnitBars_Duo2[iter_125_4][iter_125_5] = mainForm:CreateWidgetByDesc(UnitBarDesc_Duo2)
			UnitButtons_Duo2[iter_125_4][iter_125_5] = mainForm:CreateWidgetByDesc(UnitButtonDesc_Duo2)
			Icons_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Icon", false)
			Names_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Name", false)
			Levels_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Level", false)
			Backgrounds_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Background", false)
			Foregrounds_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Foreground", false)
			Bubbles_Duo2[iter_125_4][iter_125_5] = UnitBars_Duo2[iter_125_4][iter_125_5]:GetChildChecked("Bubble", false)

			Backgrounds_Duo2[iter_125_4][iter_125_5]:SetBackgroundColor({
				g = 0,
				a = 1,
				b = 0,
				r = 0
			})
			MainPanel_Duo2:AddChild(UnitBars_Duo2[iter_125_4][iter_125_5])
			MainPanel_Duo2:AddChild(UnitButtons_Duo2[iter_125_4][iter_125_5])
		end
	end

	PrepareList_Duo2()

	var_0_5 = {}
	var_0_6 = {}

	for iter_125_6, iter_125_7 in pairs(avatar.GetUnitList()) do
		var_0_5[iter_125_7] = 0

		if var_0_24.disable_buffs == false then
			var_0_6[iter_125_7] = {
				objectId = iter_125_7
			}

			common.RegisterEventHandler(eventBuffsChanged_Duo2, "EVENT_OBJECT_BUFFS_CHANGED", var_0_6[iter_125_7])
			common.RegisterEventHandler(eventBuffsAdded_Duo2, "EVENT_OBJECT_BUFF_ADDED", var_0_6[iter_125_7])
		end

		CreateNamePlate_Duo2(iter_125_7)
	end

	CollectUnits_Duo2()

	if var_0_24.disable_buffs == false then
		common.RegisterEventHandler(eventBuffsElementChanged_Duo2, "EVENT_OBJECT_BUFFS_ELEMENT_CHANGED")

		var_0_8 = true
	end

	var_0_7 = false

	DnD.Init_Duo2(MainPanel_Duo2, PanelkaDND_Duo2, true)
	DnD.Init_Duo2(OptionsNew_Duo2, Header_Duo2, true)
	DnD.Init_Duo2(ShowHideBtn_Duo2, nil, true)

	var_0_31 = Target_Duo2:GetPlacementPlain()
	var_0_32 = Target_Duo2:GetPlacementPlain()

	Target_Duo2:Show(false)
	Arrow_Duo2:SetBackgroundColor({
		g = 1,
		a = 1,
		b = 0,
		r = 0
	})
	ArrowText_Duo2:SetClassVal("class", "tip_golden")
	Arrow_Duo2:Show(false)
	ContainerItem_Duo2:Show(false)

	if not TargetsDB_Duo2[var_0_24.current_target] then
		var_0_24.current_target = 1
	end

	for iter_125_8, iter_125_9 in ipairs(TargetsDB_Duo2) do
		ContainerItems_Duo2[iter_125_8] = mainForm:CreateWidgetByDesc(ContainerItemDesc_Duo2)

		ContainerItems_Duo2[iter_125_8]:GetChildChecked("ContainerItemText", false):SetVal("text", userMods.ToWString(iter_125_9.name))
		Container_Duo2:PushBack(ContainerItems_Duo2[iter_125_8])
	end

	OptionLabel_Duo2:Show(false)
	OptionCheckBox_Duo2:Show(false)
	OptionSelector_Duo2:Show(false)
	OptionButton_Duo2:Show(false)
	PrepareOptions_Duo2()
	common.RegisterEventHandler(eventUnitsChanged_Duo2, "EVENT_UNITS_CHANGED")
	common.RegisterEventHandler(eventUnitDeadChanged_Duo2, "EVENT_UNIT_DEAD_CHANGED")
	common.RegisterEventHandler(eventEffectFinished_Duo2, "EVENT_EFFECT_FINISHED")
	common.RegisterEventHandler(eventAvatarTargetChanged_Duo2, "EVENT_AVATAR_TARGET_CHANGED")
	common.RegisterEventHandler(eventObjectHealthChanged_Duo2, "EVENT_OBJECT_HEALTH_CHANGED")
	common.RegisterEventHandler(eventObjectSelectableChanged_Duo2, "EVENT_OBJECT_SELECTABLE_CHANGED")
	common.RegisterEventHandler(eventObjectCombatChanged_Duo2, "EVENT_OBJECT_COMBAT_STATUS_CHANGED")
	common.RegisterEventHandler(eventRelationChanged_Duo2, "EVENT_UNIT_RELATION_CHANGED")
	common.RegisterEventHandler(AvatarPosChange_Duo2, "EVENT_AVATAR_POS_CHANGED")
	common.RegisterEventHandler(AvatarPosChange_Duo2, "EVENT_CAMERA_DIRECTION_CHANGED")
	common.RegisterEventHandler(PartyPosChange_Duo2, "EVENT_PARTY_MEMBER_POSITION_UPDATED")
	common.RegisterEventHandler(PartyPosChange_Duo2, "EVENT_RAID_MEMBER_POSITION_UPDATED")
	common.RegisterEventHandler(eventLibGS_Duo2, "LIBGS_GEARSCORE_AVAILABLE")
	common.RegisterReactionHandler(reactionSelectTarget_Duo2, "SelectTarget_Duo2")
	common.RegisterReactionHandler(OnReactionShowHideBtnReaction_Duo2, "ShowHideBtnReaction_Duo2")
	common.RegisterReactionHandler(OnMBtnReaction_Duo2, "MBtnReaction_Duo2")
	common.RegisterReactionHandler(OnRBtnReaction_Duo2, "RBtnReaction_Duo2")
	common.RegisterReactionHandler(OnRBtnReaction_Duo2, "AcceptChanges_Duo2")
	common.RegisterReactionHandler(OnXBtnReaction_Duo2, "XBtnReaction_Duo2")
	common.RegisterReactionHandler(OnSBtnReaction_Duo2, "SBtnReaction_Duo2")
	common.RegisterReactionHandler(OnSelectMode_Duo2, "OnSelectMode_Duo2")
	common.RegisterReactionHandler(OnPanelkaCheckbox_Duo2, "panelka_checkbox_Duo2")
	common.RegisterReactionHandler(SelectVarOfTarget_Duo2, "SelectVarOfTarget_Duo2")
	common.RegisterReactionHandler(OnPageBuffsCheckBoxClick_Duo2, "page_buffs_checkbox_Duo2")
	common.RegisterReactionHandler(ButtonEditClick_Duo2, "ButtonEditClick_Duo2")
	common.RegisterReactionHandler(ButtonDeleteClick_Duo2, "ButtonDeleteClick_Duo2")
	common.RegisterReactionHandler(RenameCancelReaction_Duo2, "RenameCancelReaction_Duo2")
	common.RegisterReactionHandler(RenameBuildReaction_Duo2, "RenameBuildReaction_Duo2")
	common.RegisterReactionHandler(RenameFocusChanged_Duo2, "RenameFocusChanged_Duo2")
	common.RegisterReactionHandler(NewItem_Duo2, "NewItem_Duo2")
	common.RegisterReactionHandler(OnSelectPage_Duo2, "select_page_Duo2")
	common.RegisterReactionHandler(OnOptionButton_Duo2, "OnOptionButton_Duo2")
	common.RegisterReactionHandler(OnOptionCheckBox_Duo2, "OnOptionCheckBox_Duo2")
	common.RegisterReactionHandler(OnOptionNext_Duo2, "OnOptionNext_Duo2")
	common.RegisterReactionHandler(OnOptionPrev_Duo2, "OnOptionPrev_Duo2")
	common.RegisterEventHandler(Duo2_OnDuoVisibilityChanged, "BUFFANNOUNCE_DUO_VISIBILITY")
	common.RegisterReactionHandler(OnCheckBoxClick_Duo2, "mouse_left_click_Duo2")
	common.RegisterReactionHandler(PanelkaDNDOnPointing_Duo2, "PanelkaDNDOnPointing_Duo2")
	common.RegisterEventHandler(eventSecondTimer_Duo2, "EVENT_SECOND_TIMER")
end

common.RegisterEventHandler(Init_Duo2, "EVENT_AVATAR_CREATED")

if avatar.IsExist() then
	Init_Duo2()
end
