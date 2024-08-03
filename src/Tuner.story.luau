--!strict
-- Services
-- stylua: ignore start
-- Packages
local Maid = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Maid"))
-- Modules
-- stylua: ignore end
-- Types
-- Constants
-- Variables
-- References
-- Class
return function(frame: Frame)
	local maid = Maid.new()
	task.spawn(function()
		local Util = require(script.Parent)
		local character: Model? = workspace:WaitForChild("Rig", 10) :: Model
		assert(character)
		local shirt: Shirt? = character:WaitForChild("Shirt", 10) :: Shirt?
		assert(shirt)

		local clothingImage: EditableImage = maid:GiveTask(Util.loadClothingImageAsync(shirt))

		local function displayImage(editableImage: EditableImage): ImageLabel
			local display = maid:GiveTask(Instance.new("ImageLabel"))
			display.Size = UDim2.new(0.5, 0, 0.5, 0)

			display.Parent = frame
			display.BackgroundTransparency = 1

			local displayImage = maid:GiveTask(editableImage:Clone())
			display.Size = UDim2.fromOffset(displayImage.Size.X, displayImage.Size.Y)
			displayImage.Parent = display
			return display
		end

		do
			local function renderTextureImage(bodyPart: Enum.BodyPartR15, tint: Color3?)
				local canvas = maid:GiveTask(Instance.new("EditableImage"))
				canvas.Size = clothingImage.Size

				for i, normal in ipairs(Enum.NormalId:GetEnumItems()) do
					local area = Util.getFaceTextureRect(bodyPart, normal)
					if area then
						local region = maid:GiveTask(clothingImage:Copy(area.Min, area.Max))
						canvas:WritePixels(
							area.Min,
							area.Max - area.Min,
							region:ReadPixels(Vector2.zero, area.Max - area.Min)
						)
					end
				end

				local display = displayImage(canvas)
				display.Name = `{bodyPart}`
				display.ImageTransparency = 0.3
				display.ImageColor3 = tint or Color3.new(1, 1, 1)
			end
			-- do
			-- 	renderTextureImage(Enum.BodyPartR15.RightUpperArm, Color3.new(1, 0, 0))
			-- 	renderTextureImage(Enum.BodyPartR15.RightLowerArm, Color3.new(0, 1, 0))
			-- 	renderTextureImage(Enum.BodyPartR15.RightHand, Color3.new(0, 0, 1))
			-- end
			do
				renderTextureImage(Enum.BodyPartR15.UpperTorso, Color3.new(1, 0, 0))
				renderTextureImage(Enum.BodyPartR15.LowerTorso, Color3.new(0, 1, 0))
			end
		end

		do
			local function renderAppliedImage(bodyPart: Enum.BodyPartR15, tint: Color3?)
				local appliedImage = Util.apply(character, clothingImage, bodyPart)
				assert(appliedImage)
				maid:GiveTask(appliedImage)

				local display = displayImage(appliedImage)
				display.Name = `{bodyPart}`
				display.ImageTransparency = 0.6
				display.ImageColor3 = tint or Color3.new(1, 1, 1)

				Util.bakeSkinTone(appliedImage, Color3.new(1, 0, 0))
			end
			-- do
			-- 	renderAppliedImage(Enum.BodyPartR15.RightUpperArm, Color3.new(1, 0, 0))
			-- 	renderAppliedImage(Enum.BodyPartR15.RightLowerArm, Color3.new(0, 1, 0))
			-- 	renderAppliedImage(Enum.BodyPartR15.RightHand, Color3.new(0, 0, 1))
			-- end
			-- do
			-- 	renderAppliedImage(Enum.BodyPartR15.UpperTorso, Color3.new(1, 0, 0))
			-- 	renderAppliedImage(Enum.BodyPartR15.LowerTorso, Color3.new(0, 1, 0))
			-- end
		end
	end)
	return function()
		maid:Destroy()
	end
end
