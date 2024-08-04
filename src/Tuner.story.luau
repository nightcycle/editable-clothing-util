--!strict
-- Services
local AssetService = game:GetService("AssetService")
-- stylua: ignore start
-- Packages
local Maid = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Maid"))
-- Modules
-- stylua: ignore end
-- Types
-- Constants
local SHIRT_URL = "http://www.roblox.com/asset/?id=5876958474" --
-- local SHIRT_URL = "http://www.roblox.com/asset/?id=207315976"
-- Variables
-- References
-- Class
return function(frame: Frame)
	local maid = Maid.new()
	local isAlive = true
	task.spawn(function()
		local Util = require(script.Parent)
		local character: Model? = workspace:WaitForChild("Rig", 10) :: Model
		assert(character)
		local shirt = maid:GiveTask(Instance.new("Shirt"))
		shirt.ShirtTemplate = SHIRT_URL

		local function displayImage(editableImage: EditableImage): ImageLabel
			local display = maid:GiveTask(Instance.new("ImageLabel"))
			display.Size = UDim2.new(0.5, 0, 0.5, 0)

			display.Parent = frame
			display.BackgroundTransparency = 1

			local displayImage = maid:GiveTask(editableImage:Clone())
			display.Size = UDim2.fromOffset(displayImage.Size.X, displayImage.Size.Y)
			display.Position = UDim2.new(0, 0, 1, 00)
			display.AnchorPoint = Vector2.new(0, 1)
			displayImage.Parent = display
			return display
		end

		do
			local minX = math.huge
			local maxX = 0
			local minY = math.huge
			local maxY = 0
			local function plotUV(editableImage: EditableImage, meshUrl: string)
				local mesh = maid:GiveTask(AssetService:CreateEditableMeshAsync(meshUrl))
				local function getPlotPosition(uv: Vector2): Vector2
					local x = math.round(uv.X * editableImage.Size.X)
					local y = math.round(uv.Y * editableImage.Size.Y)
					minX = math.min(minX, x)
					maxX = math.max(maxX, x)
					minY = math.min(minY, y)
					maxY = math.max(maxY, y)
					print(`{x}, {y}`)
					return Vector2.new(x, y)
				end

				for i, vId in ipairs(mesh:GetVertices()) do
					local uv = mesh:GetUV(vId)
					-- print(
					-- 	`{math.round(editableImage.Size.X * (uv.X + 0.5) * 2)}, {math.round(
					-- 		editableImage.Size.Y * (uv.Y + 0.5) * 2
					-- 	)}`
					-- )
					for j, oId in ipairs(mesh:GetAdjacentVertices(vId)) do
						local oUV = mesh:GetUV(oId)
						editableImage:DrawLine(
							getPlotPosition(uv),
							getPlotPosition(oUV),
							Color3.new(1, 0, 0),
							0,
							Enum.ImageCombineType.BlendSourceOver
						)
					end
					editableImage:DrawRectangle(
						getPlotPosition(uv),
						Vector2.one,
						Color3.new(1, 0, 0),
						0,
						Enum.ImageCombineType.BlendSourceOver
					)
				end

				local display = displayImage(editableImage)
				display.ZIndex = 20
			end

			local editableImage = maid:GiveTask(Instance.new("EditableImage"))
			editableImage.Size = Vector2.new(585, 559)
			-- lower right arm
			-- do
			-- 	plotUV(
			-- 		editableImage,
			-- 		"https://assetdelivery.roblox.com/v1/asset/?id=7430071013"
			-- 	)
			-- 	plotUV(editableImage, "http://www.roblox.com/asset/?id=1660648342")
			-- 	plotUV(
			-- 		editableImage,
			-- 		"https://assetdelivery.roblox.com/v1/asset/?id=8650495271"
			-- 	)
			-- 	plotUV(
			-- 		editableImage,
			-- 		"https://assetdelivery.roblox.com/v1/asset/?id=8650168400"
			-- 	)
			-- end
			-- upper torso
			do
				plotUV(editableImage, "http://www.roblox.com/asset/?id=1660648364")
			end
			-- lower torso
			-- do
			-- 	plotUV(editableImage, "http://www.roblox.com/asset/?id=1660648469")
			-- end
			print("X", minX, "-", maxX, "rng", maxX - minX)
			print("Y", minY, "-", maxY, "rng", maxY - minY)
		end

		do
			local clothingImage: EditableImage =
				maid:GiveTask(Util.loadClothingImageAsync(shirt))
			-- 	-- Util.bakeSkinTone(clothingImage, Color3.new(1, 0, 0))

			-- 	-- displayImage(clothingImage)

			-- 	do
			-- 		local function renderTextureImage(bodyPart: Enum.BodyPartR15, tint: Color3?)
			-- 			local canvas = maid:GiveTask(Instance.new("EditableImage"))
			-- 			canvas.Size = clothingImage.Size

			-- 			for i, normal in ipairs(Enum.NormalId:GetEnumItems()) do
			-- 				local area = Util.getFaceTextureRect(bodyPart, normal)
			-- 				if area then
			-- 					local region =
			-- 						maid:GiveTask(clothingImage:Copy(area.Min, area.Max))
			-- 					canvas:WritePixels(
			-- 						area.Min,
			-- 						area.Max - area.Min,
			-- 						region:ReadPixels(Vector2.zero, area.Max - area.Min)
			-- 					)
			-- 				end
			-- 			end

			-- 			local display = displayImage(canvas)
			-- 			display.Name = `{bodyPart}`
			-- 			display.ImageTransparency = 0.3
			-- 			display.ImageColor3 = tint or Color3.new(1, 1, 1)
			-- 		end
			-- 		do
			-- 			-- renderTextureImage(Enum.BodyPartR15.RightUpperArm, Color3.new(1, 0, 0))
			-- 			-- renderTextureImage(Enum.BodyPartR15.RightLowerArm, Color3.new(0, 1, 0))
			-- 			-- renderTextureImage(Enum.BodyPartR15.RightHand, Color3.new(0, 0, 1))
			-- 		end
			-- 		-- do
			-- 		-- 	renderTextureImage(Enum.BodyPartR15.UpperTorso, Color3.new(1, 0, 0))
			-- 		-- 	renderTextureImage(Enum.BodyPartR15.LowerTorso, Color3.new(0, 1, 0))
			-- 		-- end
			-- 	end

			do
				local function renderAppliedImage(
					bodyPart: Enum.BodyPartR15,
					tint: Color3?
				)
					local appliedImage = Util.apply(character, clothingImage, bodyPart)
					assert(appliedImage)
					maid:GiveTask(appliedImage)

					local surfaceAppearance =
						maid:GiveTask(Instance.new("SurfaceAppearance"))
					surfaceAppearance.Color = tint or Color3.new(1, 1, 1)
					surfaceAppearance.Parent = appliedImage.Parent

					local part = surfaceAppearance.Parent
					-- task.spawn(function()
					-- 	while isAlive do
					-- 		if surfaceAppearance.Parent then
					-- 			surfaceAppearance.Parent = nil
					-- 		else
					-- 			surfaceAppearance.Parent = part
					-- 		end
					-- 		task.wait(0.2)
					-- 	end
					-- end)

					appliedImage.Parent = surfaceAppearance

					for i, normal in ipairs(Enum.NormalId:GetEnumItems()) do
						local area = Util.getFaceUVRect(bodyPart, normal)
						if area then
							local function drawLine(a: Vector2, b: Vector2)
								appliedImage:DrawLine(
									a,
									b,
									Color3.new(0, 1, 1),
									0,
									Enum.ImageCombineType.BlendSourceOver
								)
							end
							drawLine(area.Min, area.Min + Vector2.new(area.Width, 0))
							drawLine(area.Min, area.Min + Vector2.new(0, area.Height))
							drawLine(area.Min, area.Max - Vector2.new(area.Width, 0))
							drawLine(area.Min, area.Max - Vector2.new(0, area.Height))
						end
					end

					local display = displayImage(appliedImage)
					display.Name = `{bodyPart}`
					display.ImageTransparency = 0
					display.ImageColor3 = tint or Color3.new(1, 1, 1)

					-- Util.bakeSkinTone(appliedImage, Color3.new(1, 0, 0))
				end
				-- do
				-- renderAppliedImage(
				-- 	Enum.BodyPartR15.RightUpperArm --,
				-- 	--Color3.new(0.5, 0.5, 0.5)
				-- ) --Color3.new(1, 0, 0))
				-- renderAppliedImage(
				-- 	Enum.BodyPartR15.RightLowerArm --,
				-- 	--Color3.new(0.5, 0.5, 0.5)
				-- )
				-- renderAppliedImage(Enum.BodyPartR15.RightHand) --, Color3.new(0.5, 0.5, 0.5)) -- Color3.new(0, 0, 1))
				-- end
				-- do
				renderAppliedImage(Enum.BodyPartR15.UpperTorso) --, Color3.new(0.5, 0.5, 0.5)) --Color3.new(1, 0, 0))
				-- renderAppliedImage(Enum.BodyPartR15.LowerTorso) --, Color3.new(0.5, 0.5, 0.5)) --Color3.new(0, 1, 0))
				-- end
			end
			do
				local function renderImage(bodyPart: Enum.BodyPartR15)
					local appliedImage = Util.apply(character, clothingImage, bodyPart)
					assert(appliedImage)

					local surfaceAppearance =
						maid:GiveTask(Instance.new("SurfaceAppearance"))
					surfaceAppearance.Color = Color3.new(0, 0.5, 1)
					surfaceAppearance.Parent = appliedImage.Parent

					appliedImage.Parent = surfaceAppearance
					maid:GiveTask(appliedImage)
				end
				renderImage(Enum.BodyPartR15.RightUpperArm)
				renderImage(Enum.BodyPartR15.RightLowerArm)
				renderImage(Enum.BodyPartR15.RightHand)
				renderImage(Enum.BodyPartR15.LeftUpperArm)
				renderImage(Enum.BodyPartR15.LeftLowerArm)
				renderImage(Enum.BodyPartR15.LeftHand)
				renderImage(Enum.BodyPartR15.LowerTorso)
				renderImage(Enum.BodyPartR15.UpperTorso)
			end
		end
	end)
	return function()
		isAlive = false
		maid:Destroy()
	end
end
