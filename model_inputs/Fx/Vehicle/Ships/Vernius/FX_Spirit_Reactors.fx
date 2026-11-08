{
	"type": "fx",
	"cullingRadius": 10,
	"blendFactor": 1,
	"children": [
		{
			"type": "model",
			"name": "Spirit",
			"source": "Vehicle/Vernius/Spirit/Spirit.fbx",
			"scaleX": 5,
			"scaleY": 5,
			"scaleZ": 5,
			"children": [
				{
					"type": "animEvent",
					"name": "animEvent",
					"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": -1.73187,
			"z": -2.31808,
			"scaleX": 5,
			"scaleY": 5,
			"scaleZ": 5,
			"rotationX": -90,
			"children": [
				{
					"type": "object",
					"name": "Reactor",
					"y": -1,
					"children": [
						{
							"type": "object",
							"name": "Left",
							"x": -0.5915566666666667,
							"y": 1.11334,
							"z": 0.3549566666666666,
							"scaleY": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Reactor",
									"x": -0.001843333333333308,
									"y": 0.01845999999999992,
									"z": -0.05643666666666658,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor",
									"x": 0.0003466666666666063,
									"y": 0.0006099999999998884,
									"z": -0.0007366666666666077,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor",
									"x": 0.0014966666666665907,
									"y": -0.01907000000000003,
									"z": 0.05717333333333341,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Right",
							"x": 0.5915566666666667,
							"y": 1.11334,
							"z": 0.3549566666666666,
							"scaleY": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Reactor",
									"x": -0.001843333333333308,
									"y": 0.01845999999999992,
									"z": -0.05643666666666658,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor",
									"x": 0.0003466666666666063,
									"y": 0.0006099999999998884,
									"z": -0.0007366666666666077,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor",
									"x": 0.0014966666666665907,
									"y": -0.01907000000000003,
									"z": 0.05717333333333341,
									"scaleX": 0.05,
									"scaleY": 0.05000000000000001,
									"scaleZ": 0.1,
									"rotationX": 88.8,
									"rotationZ": -86.7,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 4,
											"scaleY": 0.52,
											"scaleZ": 1.5,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 1.8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0,
															0.3529411764705882,
															0.9921568627450981
														]
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "Reactor_Big",
											"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
											"scaleX": 5,
											"scaleY": 0.65,
											"scaleZ": 2.27,
											"rotationX": 90,
											"rotationZ": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.6,
														"uvScaleY": 0.6,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1.5,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.32,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															-0.01
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.00784313725490196,
															0.2,
															0.5568627450980392
														]
													},
													"isInstance": true
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "trails",
					"name": "trails_R",
					"x": 0.32895,
					"y": -0.2094,
					"z": 0.32645,
					"startWidth": 0.35,
					"lifetime": 2.5,
					"minSpeed": 3,
					"maxSpeed": 100,
					"uvRepeat": "EClamp",
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Add",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/uGrad_inv.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.9999999999999998,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2.01,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0,
									0.2627450980392157,
									0.45098039215686275
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "trails",
					"name": "trails_L",
					"x": -0.32895,
					"y": -0.2094,
					"z": 0.32645,
					"startWidth": 0.35,
					"lifetime": 2.5,
					"minSpeed": 3,
					"maxSpeed": 100,
					"uvRepeat": "EClamp",
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Add",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"depthTest": "LessEqual"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/uGrad_inv.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.9999999999999998,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2.01,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0,
									0.2627450980392157,
									0.45098039215686275
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor_L",
					"x": -0.32895,
					"y": -0.2094,
					"z": 0.32645,
					"scaleX": 0.45,
					"scaleY": 0.31,
					"scaleZ": 0.29,
					"rotationX": 90,
					"rotationZ": -87.5,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
							"x": 1.1102230246251565e-16,
							"z": 1.1102230246251565e-16,
							"scaleX": 0.8,
							"scaleY": 0.7,
							"scaleZ": 0.8,
							"rotationX": -1.542772070128081e-25,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1.8
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.3529411764705882,
											0.9921568627450981
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Reactor_Big",
							"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
							"x": 1.1102230246251565e-16,
							"z": 1.1102230246251565e-16,
							"scaleY": 0.9,
							"scaleZ": 1.1,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.6,
										"uvScaleY": 0.6,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1.5,
											1
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.00784313725490196,
											0.2,
											0.5568627450980392
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor_R",
					"x": 0.32895,
					"y": -0.2094,
					"z": 0.32645,
					"scaleX": 0.45,
					"scaleY": 0.31,
					"scaleZ": 0.29,
					"rotationX": 90,
					"rotationZ": -92.5,
					"children": [
						{
							"type": "model",
							"name": "Reactor_Little",
							"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
							"x": 1.1102230246251565e-16,
							"z": 1.1102230246251565e-16,
							"scaleX": 0.8,
							"scaleY": 0.7,
							"scaleZ": 0.8,
							"rotationX": -1.542772070128081e-25,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1.8
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.7,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											3,
											2
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0.3529411764705882,
											0.9921568627450981
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Reactor_Big",
							"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
							"x": 1.1102230246251565e-16,
							"z": 1.1102230246251565e-16,
							"scaleY": 0.9,
							"scaleZ": 1.1,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.2,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 0.6,
										"uvScaleY": 0.6,
										"texture": "Fx/noise/T_Noise_Voronoi_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1.5,
											1
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": -1,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											2,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.00784313725490196,
											0.2,
											0.5568627450980392
										]
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "constraint",
			"name": "constraint",
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Spirit.root.JNT_ROOT"
		}
	]
}