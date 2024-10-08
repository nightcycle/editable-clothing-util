## Install
With [Wally](https://github.com/UpliftGames/wally): `nightcycle/editable-clothing-util`

## Usage
```luau
local character: Model
local shirt: Shirt


local clothingImage: EditableImage = Util.loadClothingImageAsync(shirt)

-- modifying the source clothingImage is much faster than modifying the images post application

Util.apply(character, clothingImage, Enum.BodyPartR15.RightUpperArm)
Util.apply(character, clothingImage, Enum.BodyPartR15.RightLowerArm)
Util.apply(character, clothingImage, Enum.BodyPartR15.RightHand)
Util.apply(character, clothingImage, Enum.BodyPartR15.LeftUpperArm)
Util.apply(character, clothingImage, Enum.BodyPartR15.LeftLowerArm)
Util.apply(character, clothingImage, Enum.BodyPartR15.LeftHand)
Util.apply(character, clothingImage, Enum.BodyPartR15.LowerTorso)

-- if you want it to change while on the character, you need to use the applied EditableImage
local upperTorsoImage: EditableImage? = Util.apply(character, clothingImage, Enum.BodyPartR15.UpperTorso)
assert(upperTorsoImage)

-- if you want it to match the underlying skin color, use this:
local skinColor: Color3 = Color3.new(0.5,0.5,0.5)
Util.bakeSkinTone(upperTorsoImage, skinColor)
```
