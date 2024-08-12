--!strict
--!native
-- Services
local AssetService = game:GetService("AssetService")
-- stylua: ignore start
-- Packages
-- Modules
-- stylua: ignore end
-- Types
type TranslationData = {
	UVArea: Rect,
	UVDegreeRotation: number?,
	TextureArea: Rect?,
}
type TranslationRegistry = { [Enum.BodyPartR15]: { [Enum.NormalId]: TranslationData? }? }
-- Constants
-- local TEXTURE_SIZE = Vector2.new(585, 559)
local TRANSLATIONS: TranslationRegistry = {}
do
	-- stylua: ignore start
	local TEXTURE_GAP_WIDTH = 2
	local TEXTURE_ARM_WIDTH = 64
	local TEXTURE_TORSO_WIDTH = 359 - 231

	local TEXTURE_FRONT_LEFT_OFFSET = (308 - 217)
	local TEXTURE_LEFT_LEFT_OFFSET = (374 - 19)
	local TEXTURE_BACK_LEFT_OFFSET = (440 - 85)
	local TEXTURE_RIGHT_LEFT_OFFSET = (506 - 151)

	local TEXTURE_ARM_LEFT_START_X = 19
	local TEXTURE_ARM_LEFT_END_X = TEXTURE_ARM_LEFT_START_X + TEXTURE_ARM_WIDTH
	local TEXTURE_ARM_BACK_START_X = TEXTURE_ARM_LEFT_END_X + TEXTURE_GAP_WIDTH
	local TEXTURE_ARM_BACK_END_X = TEXTURE_ARM_BACK_START_X + TEXTURE_ARM_WIDTH
	local TEXTURE_ARM_RIGHT_START_X = TEXTURE_ARM_BACK_END_X + TEXTURE_GAP_WIDTH
	local TEXTURE_ARM_RIGHT_END_X = TEXTURE_ARM_RIGHT_START_X + TEXTURE_ARM_WIDTH
	local TEXTURE_ARM_FRONT_START_X = TEXTURE_ARM_RIGHT_END_X + TEXTURE_GAP_WIDTH
	local TEXTURE_ARM_FRONT_END_X = TEXTURE_ARM_FRONT_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_ARM_UPPER_EXTENSION = 36
	local TEXTURE_ARM_UPPER_BASE_HEIGHT = 52
	local TEXTURE_ARM_UPPER_HEIGHT = TEXTURE_ARM_UPPER_BASE_HEIGHT + TEXTURE_ARM_UPPER_EXTENSION

	local TEXTURE_ARM_UPPER_START_Y = 355
	local TEXTURE_ARM_UPPER_END_Y = TEXTURE_ARM_UPPER_START_Y + TEXTURE_ARM_UPPER_HEIGHT

	local TEXTURE_ARM_LOWER_HEIGHT_EXTENSION = 36
	local TEXTURE_ARM_LOWER_BASE_HEIGHT = 36
	local TEXTURE_ARM_LOWER_HEIGHT = TEXTURE_ARM_LOWER_BASE_HEIGHT + TEXTURE_ARM_LOWER_HEIGHT_EXTENSION

	local TEXTURE_ARM_LOWER_START_Y = 408
	local TEXTURE_ARM_LOWER_END_Y = TEXTURE_ARM_LOWER_START_Y + TEXTURE_ARM_LOWER_HEIGHT

	local TEXTURE_DEPTH = 372 - 308
	local TEXTURE_HAND_BOTTOM_START_Y = 485
	local TEXTURE_HAND_BOTTOM_END_Y = TEXTURE_HAND_BOTTOM_START_Y + TEXTURE_DEPTH

	local TEXTURE_ARM_UPPER_TOP_START_Y = 289
	local TEXTURE_ARM_UPPER_TOP_END_Y = 352

	local TEXTURE_HAND_FRONT_START_Y = TEXTURE_ARM_LOWER_END_Y - 16
	local TEXTURE_HAND_FRONT_END_Y = 483

	local TEXTURE_TORSO_FRONT_START_X = 231
	local TEXTURE_TORSO_FRONT_END_X = TEXTURE_TORSO_FRONT_START_X + TEXTURE_TORSO_WIDTH

	local TEXTURE_TORSO_LEFT_START_X = TEXTURE_TORSO_FRONT_END_X + TEXTURE_GAP_WIDTH
	local TEXTURE_TORSO_LEFT_END_X = TEXTURE_TORSO_LEFT_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_TORSO_BACK_START_X = TEXTURE_TORSO_LEFT_END_X + TEXTURE_GAP_WIDTH
	local TEXTURE_TORSO_BACK_END_X = TEXTURE_TORSO_BACK_START_X + TEXTURE_TORSO_WIDTH

	local TEXTURE_TORSO_RIGHT_END_X = TEXTURE_TORSO_FRONT_START_X - TEXTURE_GAP_WIDTH
	local TEXTURE_TORSO_RIGHT_START_X = TEXTURE_TORSO_RIGHT_END_X - TEXTURE_ARM_WIDTH

	local TEXTURE_UPPER_TORSO_START_Y = 74
	local TEXTURE_UPPER_TORSO_END_Y = 170
	local TEXTURE_LOWER_TORSO_START_Y = TEXTURE_UPPER_TORSO_END_Y+1
	local TEXTURE_LOWER_TORSO_END_Y = 201

	local TEXTURE_BOTTOM_TORSO_START_Y = TEXTURE_LOWER_TORSO_END_Y + TEXTURE_GAP_WIDTH
	local TEXTURE_BOTTOM_TORSO_END_Y = TEXTURE_BOTTOM_TORSO_START_Y + TEXTURE_DEPTH

	local TEXTURE_TORSO_TOP_END_Y = TEXTURE_UPPER_TORSO_START_Y - TEXTURE_GAP_WIDTH
	local TEXTURE_TORSO_TOP_START_Y = TEXTURE_TORSO_TOP_END_Y - TEXTURE_DEPTH

	-- UVS
	local UV_SCALE = 2
	local UV_GAP = 1
	local UV_ARM_WIDTH = 142
	local UV_ARM_DEPTH = 126
	local UV_HAND_HEIGHT = 34

	local UV_ARM_UPPER_HEIGHT = (TEXTURE_ARM_UPPER_HEIGHT * UV_SCALE) - UV_GAP + 1
	local UV_ARM_LOWER_HEIGHT = (TEXTURE_ARM_LOWER_HEIGHT * UV_SCALE) - UV_GAP

	local UV_ARM_BACKRIGHT_CORNER_X = 4
	local UV_ARM_FRONTRIGHT_CORNER_X = UV_ARM_BACKRIGHT_CORNER_X + UV_ARM_WIDTH+UV_GAP
	local UV_ARM_FRONTLEFT_CORNER_X = UV_ARM_FRONTRIGHT_CORNER_X + UV_ARM_WIDTH
	local UV_ARM_BACKLEFT_CORNER_X = UV_ARM_FRONTLEFT_CORNER_X + UV_ARM_WIDTH

	local UV_ARM_UPPER_START_Y = 130-1
	local UV_ARM_UPPER_END_Y = UV_ARM_UPPER_START_Y + UV_ARM_UPPER_HEIGHT

	local UV_ARM_LOWER_START_Y = 254
	local UV_ARM_LOWER_END_Y = UV_ARM_LOWER_START_Y + UV_ARM_LOWER_HEIGHT

	local UV_HAND_START_Y = 426
	local UV_HAND_END_Y = UV_HAND_START_Y + UV_HAND_HEIGHT

	local UV_ARM_UPPER_TOP_START_Y = 4
	local UV_ARM_UPPER_TOP_END_Y = UV_ARM_UPPER_TOP_START_Y+UV_ARM_DEPTH

	local UV_TORSO_WIDTH = 192
	local UV_TORSO_DEPTH = 98
	local UV_UPPER_TORSO_HEIGHT = 350-152
	local UV_LOWER_TORSO_HEIGHT = 415-349
	local UV_TORSO_FRONTRIGHT_CORNER_X = 4-1
	local UV_TORSO_FRONTLEFT_CORNER_X = UV_TORSO_FRONTRIGHT_CORNER_X + UV_TORSO_WIDTH+1
	local UV_TORSO_BACKLEFT_CORNER_X = UV_TORSO_FRONTLEFT_CORNER_X + UV_TORSO_DEPTH-UV_GAP
	local UV_TORSO_BACKRIGHT_CORNER_X = UV_TORSO_BACKLEFT_CORNER_X + UV_TORSO_WIDTH+UV_GAP

	local UV_TORSO_UPPER_START_Y = 152--+1
	local UV_TORSO_TOPBOTTOM_OFFSET_X = 1
	local UV_TORSO_UPPER_END_Y = UV_TORSO_UPPER_START_Y + UV_UPPER_TORSO_HEIGHT+1
	local UV_TORSO_LOWER_START_Y = UV_TORSO_UPPER_END_Y-2
	local UV_TORSO_LOWER_END_Y = UV_TORSO_LOWER_START_Y + UV_LOWER_TORSO_HEIGHT

	-- stylua: ignore end
	TRANSLATIONS = {
		[Enum.BodyPartR15.UpperTorso] = {
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(202 - 1, 78 - 1, 298 + 1, 144 + 1),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_TORSO_TOP_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_TORSO_TOP_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTRIGHT_CORNER_X - 1,
					21 - 1,
					UV_TORSO_FRONTLEFT_CORNER_X,
					196 + 1
				),
			},
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_UPPER_TORSO_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_UPPER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTRIGHT_CORNER_X,
					UV_TORSO_UPPER_START_Y,
					UV_TORSO_FRONTLEFT_CORNER_X,
					UV_TORSO_UPPER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_RIGHT_START_X,
					TEXTURE_UPPER_TORSO_START_Y,
					TEXTURE_TORSO_RIGHT_END_X,
					TEXTURE_UPPER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_BACKRIGHT_CORNER_X,
					UV_TORSO_UPPER_START_Y,
					UV_TORSO_BACKRIGHT_CORNER_X + UV_TORSO_DEPTH,
					UV_TORSO_UPPER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_LEFT_START_X,
					TEXTURE_UPPER_TORSO_START_Y,
					TEXTURE_TORSO_LEFT_END_X,
					TEXTURE_UPPER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTLEFT_CORNER_X,
					UV_TORSO_UPPER_START_Y,
					UV_TORSO_BACKLEFT_CORNER_X,
					UV_TORSO_UPPER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_BACK_START_X,
					TEXTURE_UPPER_TORSO_START_Y,
					TEXTURE_TORSO_BACK_END_X,
					TEXTURE_UPPER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_BACKLEFT_CORNER_X,
					UV_TORSO_UPPER_START_Y,
					UV_TORSO_BACKRIGHT_CORNER_X,
					UV_TORSO_UPPER_END_Y
				),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LowerTorso] = {
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_BOTTOM_TORSO_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_BOTTOM_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTRIGHT_CORNER_X + UV_TORSO_TOPBOTTOM_OFFSET_X,
					415 - 1,
					UV_TORSO_FRONTLEFT_CORNER_X + UV_TORSO_TOPBOTTOM_OFFSET_X,
					546
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(202 - 1, 423, 298 + 1, 489 + 1),
			},
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_LOWER_TORSO_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_LOWER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTRIGHT_CORNER_X,
					UV_TORSO_LOWER_START_Y,
					UV_TORSO_FRONTLEFT_CORNER_X,
					UV_TORSO_LOWER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_BACK_START_X,
					TEXTURE_LOWER_TORSO_START_Y,
					TEXTURE_TORSO_BACK_END_X,
					TEXTURE_LOWER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_BACKLEFT_CORNER_X,
					UV_TORSO_LOWER_START_Y,
					UV_TORSO_BACKRIGHT_CORNER_X,
					UV_TORSO_LOWER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_LEFT_START_X,
					TEXTURE_LOWER_TORSO_START_Y,
					TEXTURE_TORSO_LEFT_END_X,
					TEXTURE_LOWER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_FRONTLEFT_CORNER_X,
					UV_TORSO_LOWER_START_Y,
					UV_TORSO_BACKLEFT_CORNER_X,
					UV_TORSO_LOWER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_RIGHT_START_X,
					TEXTURE_LOWER_TORSO_START_Y,
					TEXTURE_TORSO_RIGHT_END_X,
					TEXTURE_LOWER_TORSO_END_Y
				),
				UVArea = Rect.new(
					UV_TORSO_BACKRIGHT_CORNER_X,
					UV_TORSO_LOWER_START_Y,
					UV_TORSO_BACKRIGHT_CORNER_X + UV_TORSO_DEPTH,
					UV_TORSO_LOWER_END_Y
				),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.RightUpperArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_RIGHT_END_X,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_BACK_END_X,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X + UV_ARM_WIDTH,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_LEFT_END_X,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(156 - 2, 59 - 1, 225 + 2, 121 + 1),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_ARM_UPPER_TOP_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_ARM_UPPER_TOP_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_UPPER_TOP_START_Y - 1,
					147,
					UV_ARM_UPPER_TOP_END_Y
				),
				UVDegreeRotation = -90,
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LeftUpperArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_FRONT_END_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_RIGHT_END_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_BACK_END_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X + UV_ARM_WIDTH,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_START_Y,
					TEXTURE_ARM_LEFT_END_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_ARM_UPPER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_UPPER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_UPPER_END_Y
				),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(156 - 2, 59 - 1, 225 + 2, 121 + 1),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_ARM_UPPER_TOP_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_ARM_UPPER_TOP_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_UPPER_TOP_START_Y - 1,
					147,
					UV_ARM_UPPER_TOP_END_Y
				),
				UVDegreeRotation = 90,
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.RightLowerArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_RIGHT_END_X,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_BACK_END_X,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X + UV_ARM_WIDTH,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_LEFT_END_X,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(5, 359, 75, 421),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(84, 358, 155, 421),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LeftLowerArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_FRONT_END_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_RIGHT_END_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_BACK_END_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X + UV_ARM_WIDTH,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_START_Y,
					TEXTURE_ARM_LEFT_END_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_ARM_LOWER_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_ARM_LOWER_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_ARM_LOWER_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(5, 359, 75, 421),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(84, 358, 155, 421),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.RightHand] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_LEFT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_BACK_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_HAND_START_Y + 36 + 4,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_END_Y + 36 + 4
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_RIGHT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(359, 468, 430, 532),
			},
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_HAND_BOTTOM_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_HAND_BOTTOM_END_Y
				),
				UVArea = Rect.new(438, 428, 581, 555),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LeftHand] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_FRONT_END_X + TEXTURE_FRONT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_LEFT_START_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_LEFT_END_X + TEXTURE_LEFT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_FRONTLEFT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_BACKLEFT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_BACK_START_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_BACK_END_X + TEXTURE_BACK_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_HAND_START_Y + 36 + 4,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_END_Y + 36 + 4
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_RIGHT_START_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_ARM_RIGHT_END_X + TEXTURE_RIGHT_LEFT_OFFSET,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_HAND_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_HAND_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(359, 468, 430, 532),
			},
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(
					TEXTURE_ARM_FRONT_START_X,
					TEXTURE_HAND_BOTTOM_START_Y,
					TEXTURE_ARM_FRONT_END_X,
					TEXTURE_HAND_BOTTOM_END_Y
				),
				UVArea = Rect.new(438, 428, 581, 555),
				UVDegreeRotation = 180,
			},
		} :: { [Enum.NormalId]: TranslationData? },
	} :: TranslationRegistry
	TRANSLATIONS[Enum.BodyPartR15.RightFoot] = TRANSLATIONS[Enum.BodyPartR15.RightHand]
	TRANSLATIONS[Enum.BodyPartR15.RightLowerLeg] =
		TRANSLATIONS[Enum.BodyPartR15.RightLowerArm]
	TRANSLATIONS[Enum.BodyPartR15.RightUpperLeg] =
		TRANSLATIONS[Enum.BodyPartR15.RightUpperArm]
	TRANSLATIONS[Enum.BodyPartR15.LeftFoot] = TRANSLATIONS[Enum.BodyPartR15.LeftHand]
	TRANSLATIONS[Enum.BodyPartR15.LeftLowerLeg] =
		TRANSLATIONS[Enum.BodyPartR15.LeftLowerArm]
	TRANSLATIONS[Enum.BodyPartR15.LeftUpperLeg] =
		TRANSLATIONS[Enum.BodyPartR15.LeftUpperArm]
end

-- Variables
-- References
-- Private Functions
function drawUVWedge(
	sourceImage: EditableImage,
	canvasImage: EditableImage,
	bodyPart: Enum.BodyPartR15,
	canvasId: Enum.NormalId,
	faceId: Enum.NormalId
)
	local bodyPartData = TRANSLATIONS[bodyPart]
	if not bodyPartData then
		return
	end
	assert(bodyPartData)

	local data: TranslationData? = bodyPartData[canvasId]
	if not data then
		return
	end
	assert(data)

	local faceData: TranslationData? = bodyPartData[faceId]
	if not faceData then
		return
	end
	assert(faceData)

	local textureArea = faceData.TextureArea
	if not textureArea then
		return
	end
	assert(textureArea)

	local isFrontBack = faceId == Enum.NormalId.Front or faceId == Enum.NormalId.Back
	local isPositive = faceId == Enum.NormalId.Front or faceId == Enum.NormalId.Right
	local isTop = canvasId == Enum.NormalId.Top --and isFrontBack
	if isTop and isFrontBack then
		isPositive = not isPositive
	end
	
	local copyMin = if isTop then textureArea.Min else textureArea.Max - Vector2.new(textureArea.Width, 1)
	local copyMax = if isTop then textureArea.Min + Vector2.new(textureArea.Width, 1) else textureArea.Max

	local textureCopy = sourceImage:Copy(
		copyMin,
		copyMax
	)

	-- print(`bodyPart: {bodyPart}, isTop={isTop}, faceId={faceId}, canvasId={canvasId}, isPositive={isPositive}, isTop={isTop}`)
	-- if bodyPart == Enum.BodyPartR15.RightLowerArm and canvasId == Enum.NormalId.Top then
	-- 	local parent: ImageLabel = game:GetService("CoreGui").DebugGui.ImageLabel
	-- 	parent:ClearAllChildren()
	-- 	local debugCopy = sourceImage:Copy(Vector2.zero, sourceImage.Size)
	-- 	parent.Size = UDim2.fromOffset(debugCopy.Size.X, debugCopy.Size.Y)
		
	-- 	debugCopy:DrawRectangle(
	-- 		textureArea.Min,
	-- 		textureArea.Max-textureArea.Min,
	-- 		Color3.new(0,0,1),
	-- 		0,
	-- 		Enum.ImageCombineType.BlendSourceOver
	-- 	)

	-- 	debugCopy:DrawRectangle(
	-- 		copyMin,
	-- 		copyMax-copyMin,
	-- 		Color3.new(0,1,0),
	-- 		0,
	-- 		Enum.ImageCombineType.BlendSourceOver
	-- 	)
		
	-- 	debugCopy.Parent = parent
	-- end

	local faceSize = if isFrontBack
		then Vector2.new(data.UVArea.Width, math.round(data.UVArea.Height * 0.5))
		else Vector2.new(math.round(data.UVArea.Width * 0.5), data.UVArea.Height)
	
	local rotation = if faceId == Enum.NormalId.Back
		then 180
		elseif faceId == Enum.NormalId.Right then -90
		elseif faceId == Enum.NormalId.Left then 90
		else 0

	textureCopy:Rotate(rotation, true)
	textureCopy:Resize(faceSize)
	local angle = if isFrontBack
		then math.atan(faceSize.Y / (0.5 * faceSize.X))
		else math.atan((faceSize.Y * 0.5) / faceSize.X)
	local dim = if isFrontBack then faceSize.Y - 1 else faceSize.X - 1
	local altDim = if isFrontBack then faceSize.X - 1 else faceSize.Y - 1




	for opp = 0, dim do
		local adj = math.ceil(
			if isFrontBack then opp / math.tan(angle) else math.tan(angle) * opp
		)
		local invAdj = altDim + 1 - (adj * 2)

		local progress = if isPositive then opp else dim - opp

		local origin = if isFrontBack
			then Vector2.new(adj, progress)
			else Vector2.new(progress, adj)

		local readSize = if isFrontBack
			then Vector2.new(invAdj, 1)
			else Vector2.new(1, invAdj)

		local originOffset = if isFrontBack
			then Vector2.new(0, data.UVArea.Height * 0.5)
			else Vector2.new(data.UVArea.Width * 0.5, 0)

		if readSize.X > 0 and readSize.Y > 0 then
			local pixels = table.create(readSize.X * readSize.Y * 4, 1)
			for i, v in ipairs(pixels) do
				if i % 4 == 1 then
					pixels[i] = 0
				end
			end

			canvasImage:WritePixels(
				data.UVArea.Min
					+ origin
					+ if isPositive then Vector2.zero else originOffset,
				readSize,
				textureCopy:ReadPixels(origin, readSize)
			)
		end
	end
	textureCopy:Destroy()
end

function buildUVWedgeFace(
	sourceImage: EditableImage,
	bodyPartType: Enum.BodyPartR15,
	normalId: Enum.NormalId
)
	assert(
		normalId == Enum.NormalId.Top or normalId == Enum.NormalId.Bottom,
		`bad wedgeFace normalId: {normalId}`
	)

	local bodyPartData = TRANSLATIONS[bodyPartType]
	assert(bodyPartData, `"{bodyPartType}" is not supported`)

	local faceData = bodyPartData[normalId]
	assert(faceData, `"{normalId}" on part "{bodyPartType}" is not supported`)

	local canvasImage = Instance.new("EditableImage")
	canvasImage.Size = sourceImage.Size

	drawUVWedge(sourceImage, canvasImage, bodyPartType, normalId, Enum.NormalId.Front)
	drawUVWedge(sourceImage, canvasImage, bodyPartType, normalId, Enum.NormalId.Back)
	drawUVWedge(sourceImage, canvasImage, bodyPartType, normalId, Enum.NormalId.Right)
	drawUVWedge(sourceImage, canvasImage, bodyPartType, normalId, Enum.NormalId.Left)

	local slice = canvasImage:Copy(faceData.UVArea.Min, faceData.UVArea.Max)
	canvasImage:Destroy()

	return slice
end

-- Class
local Util = {}

Util._TRANSLATIONS = TRANSLATIONS

function Util.loadClothingImageAsync(clothing: Shirt | Pants): EditableImage
	local contentUrl = if clothing:IsA("Shirt")
		then clothing.ShirtTemplate
		else clothing.PantsTemplate

	local size = Vector2.new(585, 559)
	local editableImage = AssetService:CreateEditableImageAsync(contentUrl)
	if editableImage.Size ~= size then
		error(`texture is sized {editableImage.Size}, not the expected size of {size}`)
	end
	return editableImage
end

function Util.readFace(
	clothingImage: EditableImage,
	bodyPartType: Enum.BodyPartR15,
	normalId: Enum.NormalId
): EditableImage
	local bodyPartData = TRANSLATIONS[bodyPartType]
	assert(bodyPartData, `"{bodyPartType}" is not supported`)

	local faceData = bodyPartData[normalId]
	assert(faceData, `"{normalId}" on part "{bodyPartType}" is not supported`)

	local textureData = faceData.TextureArea
	if textureData then
		local textureImage = clothingImage:Copy(textureData.Min, textureData.Max)
		if faceData.UVDegreeRotation then
			textureImage:Rotate(faceData.UVDegreeRotation, true)
		end
		textureImage:Resize(faceData.UVArea.Max - faceData.UVArea.Min)
		return textureImage
	else
		return buildUVWedgeFace(clothingImage, bodyPartType, normalId)
	end
end

function Util.writeFace(
	clothingImage: EditableImage,
	faceImage: EditableImage,
	bodyPartType: Enum.BodyPartR15,
	normalId: Enum.NormalId
)
	local bodyPartData = TRANSLATIONS[bodyPartType]
	assert(bodyPartData, `"{bodyPartType}" is not supported`)

	local faceData = bodyPartData[normalId]
	assert(faceData, `"{normalId}" on part "{bodyPartType}" is not supported`)

	assert(
		faceData.UVArea.Width == faceImage.Size.X,
		`faceImage width ({faceImage.Size.X}) does not match UVArea width ({faceData.UVArea.Width})`
	)
	assert(
		faceData.UVArea.Height == faceImage.Size.Y,
		`faceImage height ({faceImage.Size.Y}) does not match UVArea height ({faceData.UVArea.Height})`
	)

	local size = Vector2.new(faceData.UVArea.Width, faceData.UVArea.Height)

	clothingImage:WritePixels(
		faceData.UVArea.Min,
		size,
		faceImage:ReadPixels(Vector2.zero, size)
	)
end

function Util.getFaceTextureRect(
	bodyPartType: Enum.BodyPartR15,
	normalId: Enum.NormalId
): Rect?
	local bodyPartData = TRANSLATIONS[bodyPartType]
	if not bodyPartData then
		return nil
	end
	assert(bodyPartData)

	local faceData = bodyPartData[normalId]
	if not faceData then
		return nil
	end
	assert(faceData)

	return faceData.TextureArea
end

function Util.getFaceUVRect(bodyPartType: Enum.BodyPartR15, normalId: Enum.NormalId): Rect
	local bodyPartData = TRANSLATIONS[bodyPartType]
	assert(bodyPartData, `"{bodyPartType}" is not supported`)

	local faceData = bodyPartData[normalId]
	assert(faceData)

	return faceData.UVArea
end

function Util.compile(
	clothingImage: EditableImage,
	bodyPartType: Enum.BodyPartR15,
	skinColor: Color3
): EditableImage
	local bodyPartData = TRANSLATIONS[bodyPartType]
	assert(bodyPartData, `"{bodyPartType}" is not supported`)

	local bodyPartImage = Instance.new("EditableImage")
	bodyPartImage.Size = clothingImage.Size

	-- solveFace(Enum.NormalId.Bottom)
	for i, normalId in ipairs(Enum.NormalId:GetEnumItems()) do
		local faceImage = Util.readFace(clothingImage, bodyPartType, normalId)

		local faceData = bodyPartData[normalId]
		assert(faceData, `"{normalId}" on part "{bodyPartType}" is not supported`)

		bodyPartImage:WritePixels(
			faceData.UVArea.Min,
			faceImage.Size,
			faceImage:ReadPixels(Vector2.zero, faceImage.Size)
		)

		faceImage:Destroy()
	end

	return bodyPartImage
end

function Util.apply(
	character: Model,
	clothingImage: EditableImage,
	bodyPartType: Enum.BodyPartR15
): EditableImage?
	local bodyPart: BasePart?
	for i, inst in ipairs(character:GetChildren()) do
		if inst:IsA("BasePart") and inst.Name == bodyPartType.Name then
			bodyPart = inst
			break
		end
	end
	if not bodyPart then
		return nil
	end
	assert(bodyPart)

	local bodyPartImage = Util.compile(clothingImage, bodyPartType, bodyPart.Color)
	bodyPartImage.Parent = bodyPart

	return bodyPartImage
end

function Util.bakeSkinTone(editableImage: EditableImage, skinColor: Color3)
	local sR, sG, sB = skinColor.R, skinColor.G, skinColor.B
	local pixelArray = editableImage:ReadPixels(Vector2.zero, editableImage.Size)
	for i = 1, editableImage.Size.X * editableImage.Size.Y do
		local origin = (i - 1) * 4
		local aI = origin + 4
		local a = pixelArray[aI]
		if a < 1 then
			local rI, gI, bI = origin + 1, origin + 2, origin + 3
			pixelArray[aI] = 1
			if a == 0 then
				pixelArray[rI], pixelArray[gI], pixelArray[bI] = sR, sG, sB
			else
				local r, g, b = pixelArray[rI], pixelArray[gI], pixelArray[bI]
				r += (sR - r) * (1 - a)
				g += (sG - g) * (1 - a)
				b += (sB - b) * (1 - a)
				pixelArray[rI], pixelArray[gI], pixelArray[bI] = r, g, b
			end
		end
	end
	editableImage:WritePixels(Vector2.zero, editableImage.Size, pixelArray)
end

return Util
