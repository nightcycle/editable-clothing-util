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
	local TEXTURE_LOWER_ARM_HEIGHT_EXTENSION = 36
	local UV_SCALE = 2

	local TEXTURE_ARM_GAP_WIDTH = 2
	local TEXTURE_ARM_WIDTH = 64
	local TEXTURE_LOWER_ARM_HEIGHT = 36 + TEXTURE_LOWER_ARM_HEIGHT_EXTENSION

	local TEXTURE_RIGHT_ARM_LEFT_START_X = 19
	local TEXTURE_RIGHT_ARM_LEFT_END_X = TEXTURE_RIGHT_ARM_LEFT_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_RIGHT_ARM_BACK_START_X = TEXTURE_RIGHT_ARM_LEFT_END_X + TEXTURE_ARM_GAP_WIDTH
	local TEXTURE_RIGHT_ARM_BACK_END_X = TEXTURE_RIGHT_ARM_BACK_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_RIGHT_ARM_RIGHT_START_X = TEXTURE_RIGHT_ARM_BACK_END_X + TEXTURE_ARM_GAP_WIDTH
	local TEXTURE_RIGHT_ARM_RIGHT_END_X = TEXTURE_RIGHT_ARM_RIGHT_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_RIGHT_ARM_FRONT_START_X = TEXTURE_RIGHT_ARM_RIGHT_END_X + TEXTURE_ARM_GAP_WIDTH
	local TEXTURE_RIGHT_ARM_FRONT_END_X = TEXTURE_RIGHT_ARM_FRONT_START_X + TEXTURE_ARM_WIDTH

	local TEXTURE_LOWER_ARM_START_Y = 408
	local TEXTURE_LOWER_ARM_END_Y = TEXTURE_LOWER_ARM_START_Y + TEXTURE_LOWER_ARM_HEIGHT

	local UV_ARM_WIDTH = 142
	local UV_GAP_HEIGHT = 1
	local UV_LOWER_ARM_HEIGHT = (TEXTURE_LOWER_ARM_HEIGHT * UV_SCALE) - UV_GAP_HEIGHT

	local UV_ARM_BACKRIGHT_CORNER_X = 5
	local UV_ARM_FRONTRIGHT_CORNER_X = UV_ARM_BACKRIGHT_CORNER_X + UV_ARM_WIDTH
	local UV_LOWER_ARM_START_Y = 234
	local UV_LOWER_ARM_END_Y = UV_LOWER_ARM_START_Y + UV_LOWER_ARM_HEIGHT

	local TEXTURE_UPPER_ARM_START_Y = 355
	local TEXTURE_UPPER_ARM_END_Y = 419
	local TEXTURE_UPPER_ARM_TOP_START_Y = 289
	local TEXTURE_UPPER_ARM_TOP_END_Y = 352

	local TEXTURE_HAND_FRONT_START_Y = TEXTURE_LOWER_ARM_END_Y - 2
	local TEXTURE_HAND_FRONT_END_Y = 483
	local TEXTURE_HAND_BOTTOM_START_Y = TEXTURE_HAND_FRONT_END_Y + 2
	local TEXTURE_HAND_BOTTOM_END_Y = 548

	local TEXTURE_UPPER_TORSO_START_Y = 74
	local TEXTURE_UPPER_TORSO_END_Y = 170
	local TEXTURE_LOWER_TORSO_START_Y = 170
	local TEXTURE_LOWER_TORSO_END_Y = 201

	local TEXTURE_TORSO_FRONT_START_X = 231
	local TEXTURE_TORSO_FRONT_END_X = 358

	local TEXTURE_LEFT_ARM_OFFSET_X = 506 - TEXTURE_RIGHT_ARM_FRONT_START_X

	local UV_RIGHT_UPPER_ARM_FRONTRIGHT_START_Y = 129
	local UV_RIGHT_UPPER_ARM_FRONTRIGHT_END_Y = 256
	local UV_RIGHT_UPPER_ARM_BACKLEFT_START_Y = 129
	local UV_RIGHT_UPPER_ARM_BACKLEFT_END_Y = 256
	local UV_RIGHT_UPPER_ARM_TOP_START_Y = 4
	local UV_RIGHT_UPPER_ARM_TOP_END_Y = 130

	local UV_RIGHT_HAND_FRONTLEFT_START_Y = 428
	local UV_RIGHT_HAND_FRONTLEFT_END_Y = 461
	local UV_RIGHT_HAND_FRONTLEFT_CORNER_X = 289
	local UV_RIGHT_HAND_FRONTRIGHT_CORNER_X = 145

	local TEXTURE_LEFT_ARM_FRONT_START_X = TEXTURE_RIGHT_ARM_LEFT_START_X + TEXTURE_LEFT_ARM_OFFSET_X
	local TEXTURE_LEFT_ARM_FRONT_END_X = TEXTURE_RIGHT_ARM_LEFT_END_X + TEXTURE_LEFT_ARM_OFFSET_X

	local UV_X_1 = 4
	local UV_X_2 = 146
	local UV_X_3 = 289
	local UV_X_4 = 430
	local UV_X_5 = 574

	TRANSLATIONS = {
		[Enum.BodyPartR15.UpperTorso] = {
			[Enum.NormalId.Bottom] = {
				-- TextureArea = Rect.new(
				-- 	231,
				-- 	204,
				-- 	358,
				-- 	267
				-- ),
				UVArea = Rect.new(202, 78, 298 + 1, 144),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(TEXTURE_TORSO_FRONT_START_X, 8, TEXTURE_TORSO_FRONT_END_X, 71),
				UVArea = Rect.new(3, 21, 196, 196),
			},
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_UPPER_TORSO_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_UPPER_TORSO_END_Y
				),
				UVArea = Rect.new(3, 152, 196, 350 + 1),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(165, TEXTURE_UPPER_TORSO_START_Y, 229, TEXTURE_UPPER_TORSO_END_Y),
				UVArea = Rect.new(486, 152, 582, 350),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(361, TEXTURE_UPPER_TORSO_START_Y, 425, TEXTURE_UPPER_TORSO_END_Y),
				UVArea = Rect.new(196, 152, 196 + (582 - 486) + 1, 350 + 1),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(427, TEXTURE_UPPER_TORSO_START_Y, 554, TEXTURE_UPPER_TORSO_END_Y),
				UVArea = Rect.new(486 - (196 - 3) + 0, 152, 486, 350 + 1),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LowerTorso] = {
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(231, 204, 358, 267),
				UVArea = Rect.new(3, 415, 196, 546),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(202 - 1, 423, 298, 489 + 1),
			},
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_TORSO_FRONT_START_X,
					TEXTURE_LOWER_TORSO_START_Y,
					TEXTURE_TORSO_FRONT_END_X,
					TEXTURE_LOWER_TORSO_END_Y
				),
				UVArea = Rect.new(3, 349, 196, 415),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(427, TEXTURE_LOWER_TORSO_START_Y, 554, TEXTURE_LOWER_TORSO_END_Y),
				UVArea = Rect.new(293, 349, 486, 415),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(361, TEXTURE_LOWER_TORSO_START_Y, 424, TEXTURE_LOWER_TORSO_END_Y),
				UVArea = Rect.new(196, 349, 293, 415),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(165, TEXTURE_LOWER_TORSO_START_Y, 228, TEXTURE_LOWER_TORSO_END_Y),
				UVArea = Rect.new(486, 349, 582, 415),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.RightUpperArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_2,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_START_Y,
					UV_X_3,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_START_Y,
					UV_X_2,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_4,
					UV_RIGHT_UPPER_ARM_BACKLEFT_START_Y,
					UV_X_5,
					UV_RIGHT_UPPER_ARM_BACKLEFT_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_LEFT_START_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_LEFT_END_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_3,
					UV_RIGHT_UPPER_ARM_BACKLEFT_START_Y,
					UV_X_4,
					UV_RIGHT_UPPER_ARM_BACKLEFT_END_Y
				),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(156 - 2, 59 - 1, 225 + 2, 121 + 1),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_UPPER_ARM_TOP_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_UPPER_ARM_TOP_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_UPPER_ARM_TOP_START_Y - 1,
					UV_X_2 + 1,
					UV_RIGHT_UPPER_ARM_TOP_END_Y
				),
				UVDegreeRotation = -90,
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LeftUpperArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_LEFT_ARM_FRONT_START_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_LEFT_ARM_FRONT_END_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_2,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_START_Y,
					UV_X_3,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_END_Y
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_START_Y,
					UV_X_2,
					UV_RIGHT_UPPER_ARM_FRONTRIGHT_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_4,
					UV_RIGHT_UPPER_ARM_BACKLEFT_START_Y,
					UV_X_5,
					UV_RIGHT_UPPER_ARM_BACKLEFT_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_UPPER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_X_3,
					UV_RIGHT_UPPER_ARM_BACKLEFT_START_Y,
					UV_X_4,
					UV_RIGHT_UPPER_ARM_BACKLEFT_END_Y
				),
			},
			[Enum.NormalId.Bottom] = {
				UVArea = Rect.new(156, 59 - 2, 225 + 2, 121 + 1),
			},
			[Enum.NormalId.Top] = {
				TextureArea = Rect.new(
					TEXTURE_LEFT_ARM_FRONT_START_X,
					TEXTURE_UPPER_ARM_TOP_START_Y,
					TEXTURE_LEFT_ARM_FRONT_END_X,
					TEXTURE_UPPER_ARM_TOP_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_UPPER_ARM_TOP_START_Y,
					UV_X_2,
					UV_RIGHT_UPPER_ARM_TOP_END_Y
				),
				UVDegreeRotation = -90,
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.RightLowerArm] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(UV_X_2, UV_LOWER_ARM_START_Y, UV_X_3, UV_LOWER_ARM_END_Y),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(
					UV_ARM_BACKRIGHT_CORNER_X,
					UV_LOWER_ARM_START_Y,
					UV_ARM_FRONTRIGHT_CORNER_X,
					UV_LOWER_ARM_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(430, UV_LOWER_ARM_START_Y - 1, 572 + 1, UV_LOWER_ARM_END_Y),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_LEFT_START_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_LEFT_END_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(289, UV_LOWER_ARM_START_Y, 430, UV_LOWER_ARM_END_Y),
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
					TEXTURE_RIGHT_ARM_LEFT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_LEFT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(UV_X_2, UV_LOWER_ARM_START_Y, UV_X_3, UV_LOWER_ARM_END_Y),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(UV_X_1, UV_LOWER_ARM_START_Y, UV_X_2, UV_LOWER_ARM_END_Y),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(430, UV_LOWER_ARM_START_Y - 1, 572 + 1, UV_LOWER_ARM_END_Y),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_LOWER_ARM_END_Y
				),
				UVArea = Rect.new(289, UV_LOWER_ARM_START_Y, 430, UV_LOWER_ARM_END_Y),
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
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_2 - 1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_LEFT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_LEFT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X + 142,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y + 40,
					UV_X_2 + 1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y + 72
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTRIGHT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(359, 468, 430, 532),
			},
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_HAND_BOTTOM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_HAND_BOTTOM_END_Y
				),
				UVArea = Rect.new(438, 428, 581, 555),
			},
		} :: { [Enum.NormalId]: TranslationData? },
		[Enum.BodyPartR15.LeftHand] = {
			[Enum.NormalId.Front] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_LEFT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_LEFT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_2 - 1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Left] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_BACK_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_BACK_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTLEFT_CORNER_X + 142,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Back] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_RIGHT_START_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_RIGHT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y + 40,
					UV_X_2 + 1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y + 72
				),
			},
			[Enum.NormalId.Right] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X + TEXTURE_LEFT_ARM_OFFSET_X + 1,
					TEXTURE_HAND_FRONT_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X + TEXTURE_LEFT_ARM_OFFSET_X,
					TEXTURE_HAND_FRONT_END_Y
				),
				UVArea = Rect.new(
					UV_X_1,
					UV_RIGHT_HAND_FRONTLEFT_START_Y,
					UV_RIGHT_HAND_FRONTRIGHT_CORNER_X,
					UV_RIGHT_HAND_FRONTLEFT_END_Y
				),
			},
			[Enum.NormalId.Top] = {
				UVArea = Rect.new(359, 468, 430, 532),
			},
			[Enum.NormalId.Bottom] = {
				TextureArea = Rect.new(
					TEXTURE_RIGHT_ARM_FRONT_START_X,
					TEXTURE_HAND_BOTTOM_START_Y,
					TEXTURE_RIGHT_ARM_FRONT_END_X,
					TEXTURE_HAND_BOTTOM_END_Y
				),
				UVArea = Rect.new(438, 428, 581, 555),
			},
		} :: { [Enum.NormalId]: TranslationData? },
	} :: TranslationRegistry
	TRANSLATIONS[Enum.BodyPartR15.RightFoot] = TRANSLATIONS[Enum.BodyPartR15.RightHand]
	TRANSLATIONS[Enum.BodyPartR15.RightLowerLeg] = TRANSLATIONS[Enum.BodyPartR15.RightLowerArm]
	TRANSLATIONS[Enum.BodyPartR15.RightUpperLeg] = TRANSLATIONS[Enum.BodyPartR15.RightUpperArm]
	TRANSLATIONS[Enum.BodyPartR15.LeftFoot] = TRANSLATIONS[Enum.BodyPartR15.LeftHand]
	TRANSLATIONS[Enum.BodyPartR15.LeftLowerLeg] = TRANSLATIONS[Enum.BodyPartR15.LeftLowerArm]
	TRANSLATIONS[Enum.BodyPartR15.LeftUpperLeg] = TRANSLATIONS[Enum.BodyPartR15.LeftUpperArm]
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
	local isTop = canvasId == Enum.NormalId.Top and isFrontBack
	if isTop then
		isPositive = not isPositive
	end

	local textureCopy = sourceImage:Copy(
		if isTop then textureArea.Min else textureArea.Max - Vector2.new(textureArea.Width, 1),
		if isTop then textureArea.Min + Vector2.new(textureArea.Width, 1) else textureArea.Max
	)
	local faceSize = if isFrontBack
		then Vector2.new(data.UVArea.Width, data.UVArea.Height * 0.5)
		else Vector2.new(data.UVArea.Width * 0.5, data.UVArea.Height)
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
		local adj = math.ceil(if isFrontBack then opp / math.tan(angle) else math.tan(angle) * opp)
		local invAdj = altDim + 1 - adj * 2

		local progress = if isPositive then opp else dim - opp

		local origin = if isFrontBack then Vector2.new(adj, progress) else Vector2.new(progress, adj)

		local readSize = if isFrontBack then Vector2.new(invAdj, 1) else Vector2.new(1, invAdj)

		local originOffset = if isFrontBack
			then Vector2.new(0, data.UVArea.Height * 0.5)
			else Vector2.new(data.UVArea.Width * 0.5, 0)

		if readSize.X > 0 and readSize.Y > 0 then
			canvasImage:WritePixels(
				data.UVArea.Min + origin + if isPositive then Vector2.zero else originOffset,
				readSize,
				textureCopy:ReadPixels(origin, readSize)
			)
		end
	end
	textureCopy:Destroy()
end

function buildUVWedgeFace(sourceImage: EditableImage, bodyPartType: Enum.BodyPartR15, normalId: Enum.NormalId)
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
	local contentUrl = if clothing:IsA("Shirt") then clothing.ShirtTemplate else clothing.PantsTemplate

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

	clothingImage:WritePixels(faceData.UVArea.Min, size, faceImage:ReadPixels(Vector2.zero, size))
end

function Util.getFaceTextureRect(bodyPartType: Enum.BodyPartR15, normalId: Enum.NormalId): Rect?
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
