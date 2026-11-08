{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
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
			"scaleX": 0.8,
			"scaleY": 0.8,
			"scaleZ": 0.8,
			"children": [
				{
					"type": "object",
					"name": "group",
					"editorOnly": true,
					"x": -0.7399,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenNefud",
							"source": "Character/Imperial/Sardaukar/Male01_ImperialSardaukar.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Sardaukar/Anim_Male01_Sardaukar_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "NefudMace",
							"source": "Character/Imperial/Weapon/SardaukarSword/SardaukarSword.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"rotationZ": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.NefudMace",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "Slash",
					"enabled": false,
					"x": 1.84792,
					"y": -0.38457,
					"z": 2.64267,
					"scaleX": 1.8,
					"scaleY": 2,
					"scaleZ": 1.8,
					"rotationX": -4.8,
					"rotationY": 1.3,
					"rotationZ": 15.4,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.27806,
							"y": 0.07659,
							"z": -0.0175,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationX": 3,
							"kind": 1,
							"args": [
								30,
								300,
								0.24,
								4
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
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
											1,
											0.7254901960784313,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.73,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2478656878075305,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.3296630954679192,
													"value": 2.0340441513061527,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6477075311542537,
													"value": 0.9895833333333335,
													"mode": 1,
													"prevHandle": {
														"dv": -0.10416666666666674,
														"dt": -0.10438401003675868
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.2134775066710168,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 0.55,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashDistort",
							"z": -0.01750000000000007,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.006
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.11561496315190434,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.4331533601566182,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.11561496315190434,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 0.6214086066500564,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.190607252902203,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashImpact",
							"enabled": false,
							"z": 0.13808,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
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
											"culling": "None",
											"colorMask": 255,
											"drawOrder": "100",
											"depthTest": "LessEqual",
											"parallax": 0
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.23970832035183776,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5665519254945832,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6093852860053552,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.659357539934591,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.253305406391364,
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
											1,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.11561496315190434,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.4331533601566182,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 0.55,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashContraste",
							"enabled": false,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
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
											"culling": "None",
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.22842710606093475,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5665544426743268,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5947925494531558,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.060626897820058256
													},
													"nextHandle": {
														"dv": 0.015029727053590165,
														"dt": 0.0546723435804825
													}
												},
												{
													"time": 0.6265352529731136,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.3177035081397737,
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
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.11561496315190434,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.4331533601566182,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.11561496315190434,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 0.6214086066500564,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.190607252902203,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
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
					"name": "Slash",
					"enabled": false,
					"x": 1.32637,
					"y": 0.93895,
					"z": 3.43442,
					"scaleX": 2,
					"scaleY": 2.3,
					"scaleZ": 2,
					"rotationX": -171.8,
					"rotationY": -2.2,
					"rotationZ": 8.5,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.27806,
							"y": 0.07659,
							"z": -0.0175,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationX": 3,
							"kind": 1,
							"args": [
								30,
								300,
								0.24,
								4
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
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
											1,
											0.7254901960784313,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.73,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7361768602452174,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.7732433152514735,
													"value": 2.0340441513061527,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.0959281836279673,
													"value": 0.9895833333333335,
													"mode": 1,
													"prevHandle": {
														"dv": -0.10416666666666674,
														"dt": -0.10438401003675868
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.6657226887175518,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 0.55,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashDistort",
							"z": -0.01750000000000007,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
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
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.006
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6137892137067565,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.8690154175811493,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6137892137067565,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 1.071590596934643,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.644558067186811,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashImpact",
							"enabled": false,
							"z": 0.13808,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
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
											"culling": "None",
											"colorMask": 255,
											"drawOrder": "100",
											"depthTest": "LessEqual",
											"parallax": 0
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.7286278580945577,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0208250520122126,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0604639590949339,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1067093506914425,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.7025802781639297,
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
											1,
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": true
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6137892137067565,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.8690154175811493,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 0.55,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashContraste",
							"enabled": false,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
								4
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
											"culling": "None",
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7181879813320304,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.020827381464135,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0469595288709772,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.060626897820058256
													},
													"nextHandle": {
														"dv": 0.015029727053590165,
														"dt": 0.0546723435804825
													}
												},
												{
													"time": 1.0763349049885136,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.7621756575847625,
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
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1.5,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6137892137067565,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.8690154175811493,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.6137892137067565,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 1.071590596934643,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.644558067186811,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.27,
										"saturation": 1,
										"width": 0.44,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "NightEmissive",
					"source": "shaders/NightEmissive.hx",
					"props": {
						"amount": 0.85,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				}
			]
		}
	]
}