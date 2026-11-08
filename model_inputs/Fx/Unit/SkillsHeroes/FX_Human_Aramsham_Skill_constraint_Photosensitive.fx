{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "Aramsham",
			"editorOnly": true,
			"scaleX": 2.1999999999999997,
			"scaleY": 2.1999999999999997,
			"scaleZ": 2.1999999999999997,
			"children": [
				{
					"type": "model",
					"name": "Male01_ImperialAramsham",
					"source": "Character/Imperial/Aramsham/Male01_ImperialAramsham.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Aramsham/Anim_Male01_Aramsham_Skill.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Aramsham_Sword",
					"source": "Character/Imperial/Weapon/AramshamSword/Aramsham_Sword.fbx",
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"rotationX": -90
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.Aramsham.Aramsham_Sword",
					"target": "FXAnimation.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.4,
			"scaleY": 0.4,
			"scaleZ": 0.4,
			"children": [
				{
					"type": "object",
					"name": "Passive",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.05628,
							"y": 0.00233,
							"z": -0.02737,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"rotationY": -38.3155323490468,
							"rotationZ": 42.31532939996876,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "WhiteFlames",
									"z": 0.25,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": -90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask03.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 0.75,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/FireMask05.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1701327223836298,
															"value": 0.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26643086747757283,
																"dt": -0.07011519803730601
															},
															"nextHandle": {
																"dv": -0.26643086747757283,
																"dt": 0.07011519803730601
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlames",
									"x": -0.00322,
									"y": -0.01796,
									"z": 0.4886,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": -90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"drawOrder": "110"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask04.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1701327223836298,
															"value": 0.45,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26643086747757283,
																"dt": -0.07011519803730601
															},
															"nextHandle": {
																"dv": -0.26643086747757283,
																"dt": 0.07011519803730601
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "BlackFlamesSmall",
									"x": -0.0083,
									"y": -0.07982,
									"z": 0.22997,
									"scaleY": 1.2,
									"scaleZ": 0.94,
									"rotationX": -90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 5,
												"uScale": 2,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask04.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.49,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.36529144793833346,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.056710907461209936
											}
										},
										{
											"time": 0.6292113486311832,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.40844782039338057,
												"dt": -0.1405444228386507
											},
											"nextHandle": {
												"dv": -0.40844782039338057,
												"dt": 0.1405444228386507
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_WhiteFlames",
							"enabled": false,
							"x": -0.17259,
							"y": 0.01993,
							"z": 0.01374,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"rotationX": 100,
							"rotationY": 14.5,
							"rotationZ": 12.5,
							"albedoMap": "Fx/Alphas/T_circle.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.36529144793833346,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 0.6292113486311832,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"enabled": false,
							"x": 0.23285999999999998,
							"y": 0.05922999999999999,
							"z": -0.1094,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 1.1102230246251565e-16,
									"z": -2.0816681711721685e-17,
									"scaleX": 3,
									"scaleY": 4,
									"rotationX": 100,
									"rotationY": 14.500000000000005,
									"rotationZ": 12.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.27506790220753685,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.295066432927524,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3368523848572298,
															"value": 0,
															"mode": 2
														}
													]
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
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"x": 1.1102230246251565e-16,
									"z": -2.0816681711721685e-17,
									"scaleX": 3.0000000000000004,
									"scaleY": 3.0000000000000004,
									"rotationX": 100,
									"rotationY": 14.500000000000005,
									"rotationZ": 12.5,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.3351596593051834,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3670072688894952,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5622334594157292,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White_Sword",
									"x": -0.21914,
									"y": 0.56536,
									"z": 1.32267,
									"scaleY": 3,
									"rotationX": 37.5,
									"rotationY": 1.7,
									"rotationZ": 30,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.3351596593051834,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3670072688894952,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5622334594157292,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
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
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
		}
	]
}