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
			"name": "FXRoot",
			"scaleX": 6,
			"scaleY": 6,
			"scaleZ": 6,
			"children": [
				{
					"type": "object",
					"name": "Aramsham",
					"editorOnly": true,
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
									"animation": "Anim/Male01/Aramsham/Anim_Male01_Aramsham_FightIdle.fbx",
									"loop": true
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
							"object": "FXAnimation.FXRoot.Aramsham.Aramsham_Sword",
							"target": "FXAnimation.FXRoot.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.283810691183656,
												"dt": -0.4514872445545641
											},
											"nextHandle": {
												"dv": 2.5734375000000007,
												"dt": 0.35381887543876234
											}
										},
										{
											"time": 0.3227401904340062,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.15624999999999956,
												"dt": -0.1601747611783586
											},
											"nextHandle": {
												"dv": 0.15624999999999956,
												"dt": 0.1601747611783586
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
											"time": 0,
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
											"time": 0.1701327223836298,
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
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
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
									"name": "polygon",
									"x": -0.00503,
									"y": 0.00861,
									"z": 0.30845,
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
													"emissive": 2
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
												"progress": 0.15,
												"saturation": 0.75,
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
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
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
									"name": "polygon",
									"x": -0.00503,
									"y": 0.00861,
									"z": 0.30845,
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
													"emissive": 2
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
												"progress": 0.21,
												"saturation": 0.75,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered02.png",
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
													1,
													1
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_WhiteFlames",
							"x": -0.17259,
							"y": 0.01993,
							"z": 0.01374,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"rotationX": 131.6,
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
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0.0023584905660377358,
													"value": 0.23777777777777778,
													"mode": 2
												},
												{
													"time": 0.0330188679245283,
													"value": 1.2666666666666666,
													"mode": 2
												},
												{
													"time": 0.09191987008626422,
													"value": 0.7377777777777778,
													"mode": 2
												},
												{
													"time": 0.2055869283422757,
													"value": 1.4666666666666666,
													"mode": 2
												},
												{
													"time": 0.2993961482809749,
													"value": 0.5377777777777778,
													"mode": 2
												},
												{
													"time": 0.4438416584165329,
													"value": 0.8666666666666667,
													"mode": 2
												},
												{
													"time": 0.4884884524584327,
													"value": 0.5044444444444445,
													"mode": 2
												},
												{
													"time": 0.5830346045471616,
													"value": 1.5333333333333334,
													"mode": 2
												},
												{
													"time": 0.7353589606901137,
													"value": 0.5711111111111111,
													"mode": 2
												},
												{
													"time": 0.7878846007394076,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 0.9270775468700362,
													"value": 0.20444444444444446,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"time": 0.1701327223836298,
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
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											2
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0,
											0,
											0,
											0
										],
										"mask": "Fx/noise/Water_03.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
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
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"x": -0.04708,
							"y": 0.03655,
							"z": -0.00598,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": 131.5,
							"rotationY": 14.1,
							"rotationZ": 12.2,
							"albedoMap": "Fx/Alphas/T_circle.png",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.2
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0.0023584905660377358,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 0.0330188679245283,
													"value": 1.2666666666666666,
													"mode": 2
												},
												{
													"time": 0.04009433962264151,
													"value": 0.5333333333333333,
													"mode": 2
												},
												{
													"time": 0.16094013430037596,
													"value": 1.4666666666666666,
													"mode": 2
												},
												{
													"time": 0.1680156059984892,
													"value": 0.3333333333333333,
													"mode": 2
												},
												{
													"time": 0.36514131078180295,
													"value": 0.8666666666666667,
													"mode": 2
												},
												{
													"time": 0.37929225417802936,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 0.456883232548552,
													"value": 1.5333333333333334,
													"mode": 2
												},
												{
													"time": 0.5418847641854919,
													"value": 0.36666666666666664,
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
										"uvScaleX": 2,
										"uvScaleY": 6,
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
							"type": "emitter",
							"name": "emitter",
							"props": {
								"alignMode": "Screen",
								"simulationSpace": "World",
								"emitRate": 8,
								"emitAngle": 81.82,
								"emitOrientation": "Speed",
								"instScale": 0.1,
								"instScale_rand": 0.025,
								"instStretch": [
									1,
									0.5,
									1
								],
								"instOrbitSpeed": [
									1.5,
									0,
									0
								],
								"instOrbitSpeed_rand": [
									0.5,
									0,
									0
								],
								"instWorldSpeed": [
									0.25,
									0,
									4
								],
								"lifeTime": 0.75,
								"lifeTimeRand": 0.25,
								"instWorldSpeed_rand": [
									-0.1,
									0,
									2
								]
							},
							"x": 0.08695,
							"y": 0.00776,
							"z": -0.04341,
							"rotationY": -24.55,
							"rotationZ": -169.09,
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
											"emissive": 10,
											"drawOrder": "120"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/Spark.png"
									}
								},
								{
									"type": "shader",
									"name": "ParticleColorRandom",
									"source": "hrt.shader.ParticleColorRandom",
									"props": {
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6868411589695034
											},
											"nextHandle": {
												"dv": -7.995055597614935e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"time": 0.1,
											"value": 1.4666666666666666,
											"mode": 0,
											"prevHandle": {
												"dv": -1.2333333333333334,
												"dt": -0.005038382760988308
											},
											"nextHandle": {
												"dv": 3.9705289398512713,
												"dt": 0.015185602778625502
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Sword",
					"enabled": false,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"y": -1.21,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"target": "camera",
							"lockAxis": [
								0,
								1,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "White",
									"y": 0.16235,
									"z": -0.08911,
									"scaleX": 1.56,
									"scaleY": 2.5,
									"scaleZ": 1.25,
									"rotationX": -90,
									"rotationY": 92.73,
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
												"progress": 0.08,
												"saturation": 0.75,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered02.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds_Dissolve.png",
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
									"name": "Black",
									"y": 0.67172,
									"z": -0.06482,
									"scaleX": 0.57,
									"scaleY": 1.5,
									"scaleZ": 0.84,
									"rotationX": -90,
									"rotationY": 92.73,
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
												"progress": 0.26,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A_Tapered02.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
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
												"noiseTexture": "Fx/noise/FireAlpha.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													2
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_WhiteFlames",
							"x": -0.17259,
							"y": -0.46595,
							"z": 0.01374,
							"scaleX": 2.5,
							"rotationX": 90,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/circGrad01.png",
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
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0.0023584905660377358,
													"value": 0.23777777777777778,
													"mode": 2
												},
												{
													"time": 0.0330188679245283,
													"value": 1.2666666666666666,
													"mode": 2
												},
												{
													"time": 0.09191987008626422,
													"value": 0.7377777777777778,
													"mode": 2
												},
												{
													"time": 0.2055869283422757,
													"value": 1.4666666666666666,
													"mode": 2
												},
												{
													"time": 0.2993961482809749,
													"value": 0.5377777777777778,
													"mode": 2
												},
												{
													"time": 0.4438416584165329,
													"value": 0.8666666666666667,
													"mode": 2
												},
												{
													"time": 0.4884884524584327,
													"value": 0.5044444444444445,
													"mode": 2
												},
												{
													"time": 0.5830346045471616,
													"value": 1.5333333333333334,
													"mode": 2
												},
												{
													"time": 0.7353589606901137,
													"value": 0.5711111111111111,
													"mode": 2
												},
												{
													"time": 0.7878846007394076,
													"value": 1.0666666666666667,
													"mode": 2
												},
												{
													"time": 0.9270775468700362,
													"value": 0.20444444444444446,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"enabled": false,
									"props": {
										"UVScale": [
											1,
											2
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0,
											0,
											0,
											0
										],
										"mask": "Fx/noise/Water_03.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.x",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
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
										"uvScaleY": 2,
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
							"type": "emitter",
							"name": "emitter",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"simulationSpace": "World",
								"emitRate": 8,
								"emitAngle": 81.82,
								"emitOrientation": "Speed",
								"instScale": 0.1,
								"instScale_rand": 0.025,
								"instStretch": [
									1,
									0.5,
									1
								],
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed": [
									0.25,
									0,
									3
								],
								"lifeTime": 0.75,
								"lifeTimeRand": 0.25,
								"instWorldSpeed_rand": [
									-0.1,
									0,
									1
								]
							},
							"x": 0.01915,
							"y": -0.40029,
							"z": 0.01835,
							"scaleX": 0.5,
							"scaleZ": 0.5,
							"rotationY": -24.55,
							"rotationZ": 180,
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
											"emissive": 10,
											"drawOrder": "120"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/Spark.png"
									}
								},
								{
									"type": "shader",
									"name": "ParticleColorRandom",
									"source": "hrt.shader.ParticleColorRandom",
									"props": {
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6868411589695034
											},
											"nextHandle": {
												"dv": -7.995055597614935e-16,
												"dt": 0.3333333333333333
											}
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
					"object": "FXAnimation.FXRoot.Passive",
					"target": "FXAnimation.FXRoot.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Sword",
					"target": "FXAnimation.FXRoot.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		}
	]
}