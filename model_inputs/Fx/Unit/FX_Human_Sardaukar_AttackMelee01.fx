{
	"type": "fx",
	"duration": 2.5,
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
							"editorOnly": true,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Sardaukar/Anim_Male01_Sardaukar_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "NefudMace",
							"source": "Character/Imperial/Weapon/SardaukarSword/SardaukarSword.fbx",
							"editorOnly": true,
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
					"type": "emitter",
					"name": "Impact",
					"props": {
						"instScale_rand": 0.8,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.615686274509804,
							0.6470588235294118,
							0.7490196078431373,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"emitShape": "Box",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 4,
						"emitAngle": 1,
						"alignMode": "Screen",
						"lifeTime": 4,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.615686274509804,
							0.7490196078431373,
							0.7450980392156863,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"emitRate": 1,
						"speedFactor": 3.2,
						"maxCount": 2,
						"frameDivisionX": 0,
						"frameDivisionY": 0,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"burstDelay": 0.5,
						"seedGroup": 1,
						"warmUpTime": -1.1
					},
					"x": 3.00844,
					"y": 0.05069,
					"z": 2.49099,
					"scaleX": 0.015,
					"scaleY": 0.015,
					"scaleZ": 0.015,
					"rotationZ": 15.4,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 2
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_04.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2833333333333333,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6477951347620967,
														"dt": -9.080851668466424e-17
													},
													"nextHandle": {
														"dv": 0.8666666666666666,
														"dt": 0
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.29000000000000004
													},
													"nextHandle": {
														"dv": -2.9391523179536476e-16,
														"dt": 0.36
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01694444444444443,
														"dt": -0.27
													},
													"nextHandle": {
														"dv": 0.013434004892663146,
														"dt": 0.21406315992899264
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
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.28,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.07,
											-0.05
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.1,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 1.408519742567825,
														"dt": -0.014085197425678224
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4650000000000001
													},
													"nextHandle": {
														"dv": -2.1771608536988747e-16,
														"dt": 0.3333350157390327
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
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
											0.6941176470588235,
											0.6941176470588235
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0358306472229046,
										"dt": -0.1104807592495474
									},
									"nextHandle": {
										"dv": 1.0254649251175496,
										"dt": 0.11
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.815
									},
									"nextHandle": {
										"dv": -1.582726646250665e-16,
										"dt": 0.2500018203703057
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Slash",
					"x": 1.77849,
					"y": -0.59255,
					"z": 2.5475,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
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
													"time": 0.5372309303283692,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.5306013298034673,
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
													"time": 0.8818243882454527,
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
													"time": 1.427611008193681,
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
							"enabled": false,
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
													"time": 0.4199999999999996,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6223381428982702,
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
													"time": 0.4199999999999996,
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
													"time": 0.858512248411885,
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
													"time": 1.4073381428982703,
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
											"emissive": 8,
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
													"time": 0.5299999999999996,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8098856735229494,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8478544235229494,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8921512985229494,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.4629156293925385,
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
													"time": 0.4199999999999996,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6223381428982702,
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
													"time": 0.5199999999999996,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8098879048250753,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8349189928362307,
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
													"time": 0.863056658429157,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.5199999999999996,
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
													"time": 0.4199999999999996,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6223381428982702,
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
													"time": 0.4199999999999996,
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
													"time": 0.858512248411885,
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
													"time": 1.4073381428982703,
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
					"type": "emitter",
					"name": "Impact",
					"props": {
						"instScale_rand": 0,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.615686274509804,
							0.6470588235294118,
							0.7490196078431373,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"emitShape": "Box",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 6,
						"emitAngle": 1,
						"alignMode": "Screen",
						"lifeTime": 0.07,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.615686274509804,
							0.7490196078431373,
							0.7450980392156863,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"emitRate": 1,
						"maxCount": 2,
						"frameDivisionX": 0,
						"frameDivisionY": 0,
						"emitType": "Burst",
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"burstDelay": 0.5,
						"seedGroup": 1,
						"warmUpTime": -0.45
					},
					"x": 3.00844,
					"y": 0.05069,
					"z": 2.49099,
					"scaleX": 0.015,
					"scaleY": 0.015,
					"scaleZ": 0.015,
					"rotationZ": 15.4,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 5
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare06_512.png",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2833333333333333,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6477951347620967,
														"dt": -9.080851668466424e-17
													},
													"nextHandle": {
														"dv": 0.8666666666666666,
														"dt": 0
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.29000000000000004
													},
													"nextHandle": {
														"dv": -2.9391523179536476e-16,
														"dt": 0.36
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01694444444444443,
														"dt": -0.27
													},
													"nextHandle": {
														"dv": 0.013434004892663146,
														"dt": 0.21406315992899264
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.28,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.07,
											-0.05
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.1,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 1.408519742567825,
														"dt": -0.014085197425678224
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4650000000000001
													},
													"nextHandle": {
														"dv": -2.1771608536988747e-16,
														"dt": 0.3333350157390327
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": true
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
											0.5764705882352941,
											0.5764705882352941
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0358306472229046,
										"dt": -0.1104807592495474
									},
									"nextHandle": {
										"dv": 1.0254649251175496,
										"dt": 0.11
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.815
									},
									"nextHandle": {
										"dv": -1.582726646250665e-16,
										"dt": 0.2500018203703057
									}
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