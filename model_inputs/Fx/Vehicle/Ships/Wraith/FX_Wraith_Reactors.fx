{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Lights",
					"y": 1.46,
					"children": [
						{
							"type": "model",
							"name": "Wraith_Light02",
							"source": "Fx/Meshes_Common/Wraith_Light02.fbx",
							"y": 3.50546,
							"rotationX": 90,
							"rotationY": -21,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5058823529411764,
											0.6039215686274509,
											0.3176470588235294
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.1,
										"maxAlpha": 0.7,
										"frequency": 0.25
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Wraith_Light",
							"source": "Fx/Meshes_Common/Wraith_Light.fbx",
							"rotationX": 90,
							"rotationY": -30,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5058823529411764,
											0.6039215686274509,
											0.3176470588235294
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.1,
										"maxAlpha": 0.7,
										"frequency": 0.25
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"y": -3.23438,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "SmallReactors",
							"x": 4.51737,
							"children": [
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.21462,
									"y": 3.78453,
									"z": -6.12193,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.33,
									"rotationX": 36.1,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.21462,
									"y": 6.06509,
									"z": -3.83106,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.33,
									"rotationX": 36.1,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.26074,
									"y": 6.07147,
									"z": 3.83192,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.3299999999999996,
									"rotationX": 131,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.21464,
									"y": 3.7215,
									"z": 6.11796,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.33,
									"rotationX": 131,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.26074,
									"y": -3.73713,
									"z": 6.1496,
									"scaleX": 5,
									"scaleY": 4.169999999999999,
									"scaleZ": 3.3299999999999987,
									"rotationX": -139,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.21464,
									"y": -6.02384,
									"z": 3.80028,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.33,
									"rotationX": -139,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.26071,
									"y": -3.81721,
									"z": -6.10077,
									"scaleX": 5,
									"scaleY": 4.169999999999999,
									"scaleZ": 3.329999999999998,
									"rotationX": 130.3,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Reactor_LB",
									"x": 0.21463,
									"y": -6.1391,
									"z": -3.78623,
									"scaleX": 5,
									"scaleY": 4.17,
									"scaleZ": 3.33,
									"rotationX": 130.3,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.15000000000000005,
											"scaleY": 0.15000000000000002,
											"scaleZ": 0.30000000000000004,
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
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
											"x": 1.1102230246251565e-16,
											"z": 1.1102230246251565e-16,
											"scaleX": 0.25000000000000006,
											"scaleY": 0.25,
											"scaleZ": 0.40000000000000013,
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
												},
												{
													"type": "object",
													"name": "group"
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle"
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -8.68464,
					"power": 2.42,
					"range": 50,
					"size": 0,
					"zNear": 0.02
				}
			]
		}
	]
}