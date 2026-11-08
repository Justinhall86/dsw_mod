{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
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
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501423e-17,
					"children": [
						{
							"type": "model",
							"name": "male01_SmugglerBannerjee",
							"source": "Character/Vernius/Unit/Ctair/Male01_Ctair.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Ctair/Anim_Male01_Ctair_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Vernius/Weapon/CtairSword/CtairSword.fbx",
							"y": 0.11864,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 0.65,
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
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
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
					"type": "object",
					"name": "01",
					"x": 5.50706,
					"y": 0.05058,
					"z": 2.53011,
					"rotationX": 169.3,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"x": -0.68667,
							"y": -0.58269,
							"z": -0.00127,
							"scaleX": 1.2899999999999998,
							"scaleY": 0.64,
							"scaleZ": 1.63,
							"rotationX": 135,
							"rotationY": 0.7,
							"rotationZ": -17.6,
							"time": -0.03,
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"color": [
										0.2784313725490196,
										0.2784313725490196,
										0.2784313725490196,
										1
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2.27,
										"power": 3.79
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SLASH",
							"x": -1.47834,
							"y": -0.25367,
							"z": 0.10854,
							"scaleX": 1.75,
							"scaleY": 1.5999999999999999,
							"scaleZ": 1.5999999999999999,
							"rotationX": -150.1,
							"rotationY": -2.6,
							"rotationZ": -2.1,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 0.1,
									"rotationY": -0.1,
									"rotationZ": 46.2,
									"kind": 1,
									"args": [
										24,
										310,
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
													"emissive": 4
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
													"keys": [
														{
															"time": 0.009724634614621787,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.0529752710547904,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.10050764163102777,
																"dt": -0.6467262683139329
															},
															"nextHandle": {
																"dv": 0.055870662776599245,
																"dt": 0.33161554377353464
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
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0.009724634614621787,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.464783926310201,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.2859536732051973,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.1388888888888889,
																"dt": -0.615
															},
															"nextHandle": {
																"dv": -0.043250236625664115,
																"dt": 0.19151204777844172
															}
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
													0.403921568627451,
													0.3058823529411765,
													0.8352941176470589
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashBlack",
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"kind": 1,
									"args": [
										24,
										280,
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
															"time": 0.009724634614621787,
															"value": -2.425986213684083,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1803902618828348,
																"dt": -0.47465505272181074
															},
															"nextHandle": {
																"dv": 0.9145786525067239,
																"dt": 0.36814327172597683
															}
														},
														{
															"time": 1.114075303101751,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01829157305013407,
																"dt": -0.7229200815073025
															},
															"nextHandle": {
																"dv": 0.008386955341055453,
																"dt": 0.3316701041992479
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
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0.009724634614621787,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.41294698489642917,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.2341167317914246,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.010995608538952428,
																"dt": -0.6427923963018025
															},
															"nextHandle": {
																"dv": -0.010995608538952428,
																"dt": 0.6427923963018025
															}
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
						},
						{
							"type": "polygon",
							"name": "Hit",
							"x": 2.29663,
							"y": 1.59752,
							"z": 1.41951,
							"scaleX": 3.67,
							"scaleY": 2.460000000000001,
							"scaleZ": 0.7199999999999995,
							"rotationX": -15.8,
							"rotationY": -25,
							"rotationZ": 119.3,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 15
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatFlash.png"
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
													"time": 0.3749965968087328,
													"value": 0.01416666666666666,
													"mode": 1,
													"prevHandle": {
														"dv": 0.3775126578654911,
														"dt": -0.49657530216143814
													},
													"nextHandle": {
														"dv": 0.023114784558614043,
														"dt": 0.08500000000000008
													}
												},
												{
													"time": 0.41631841178688483,
													"value": 0.9419580650329591,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.0020841860073189666
													}
												},
												{
													"time": 0.4270605746123701,
													"value": 0.9419580650329591,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.0020841860073189666
													}
												},
												{
													"time": 0.43410083980532455,
													"value": 0.9419580650329591,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -0.6883794651925124,
														"dt": 0.022481199434944754
													}
												},
												{
													"time": 0.499570173684396,
													"value": 0,
													"mode": 2
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
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.3,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 200,
										"power": 23.48
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": 4284698838
													},
													{
														"position": 1,
														"color": -7839517
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.29537390465396623,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.29537390465396623,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.29537390465396623,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.29537390465396623,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.30797879396961036,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.3205836832852545,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0020841860073189666
											}
										},
										{
											"time": 0.333709962296233,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -5.558793937276,
												"dt": -0.2639499044713589
											},
											"nextHandle": {
												"dv": 3.822688890614707,
												"dt": 0.18159011429616972
											}
										},
										{
											"time": 0.8401071675675429,
											"value": 4,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "02",
					"x": 3.42688,
					"y": 1.13261,
					"z": 1.8137,
					"rotationX": -15.3,
					"rotationY": 5.2,
					"rotationZ": 40.4,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"enabled": false,
							"x": -0.68667,
							"y": -0.58269,
							"z": -0.00127,
							"scaleX": 1.2899999999999998,
							"scaleY": 0.64,
							"scaleZ": 1.63,
							"rotationX": 135,
							"rotationY": 0.7,
							"rotationZ": -17.6,
							"time": 0.2765288629057567,
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"color": [
										0.2784313725490196,
										0.2784313725490196,
										0.2784313725490196,
										1
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2.27,
										"power": 3.79
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SLASH",
							"x": -1.47834,
							"y": -0.25367,
							"z": 0.10854,
							"scaleX": 1.75,
							"scaleY": 1.5999999999999999,
							"scaleZ": 1.5999999999999999,
							"rotationX": -150.1,
							"rotationY": -2.6,
							"rotationZ": -2.1,
							"children": [
								{
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 3.5,
									"rotationX": 0.1,
									"rotationY": -0.1,
									"rotationZ": 41.6,
									"kind": 1,
									"args": [
										24,
										310,
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
													"emissive": 4
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3398232730211573,
															"value": -2.425986213684083,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1803902618828348,
																"dt": -0.47465505272181074
															},
															"nextHandle": {
																"dv": 0.9145786525067239,
																"dt": 0.36814327172597683
															}
														},
														{
															"time": 1.4405272035278038,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01829157305013407,
																"dt": -0.7229200815073025
															},
															"nextHandle": {
																"dv": 0.008386955341055453,
																"dt": 0.3316701041992479
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftX",
													"enabled": false,
													"keys": [
														{
															"time": 0.3398232730211573,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.4405272035278038,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.10050764163102777,
																"dt": -0.6467262683139329
															},
															"nextHandle": {
																"dv": 0.055870662776599245,
																"dt": 0.33161554377353464
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftX",
													"keys": [
														{
															"time": 0.3398232730211573,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.3794271714808433,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.10050764163102777,
																"dt": -0.6467262683139329
															},
															"nextHandle": {
																"dv": 0.055870662776599245,
																"dt": 0.33161554377353464
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
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0.3398232730211573,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.7912358267362531,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.6124055736312501,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.1388888888888889,
																"dt": -0.615
															},
															"nextHandle": {
																"dv": -0.043250236625664115,
																"dt": 0.19151204777844172
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -246930531
															},
															{
																"position": 0.98828125,
																"color": -9879142
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.403921568627451,
													0.3058823529411765,
													0.8352941176470589
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashBlack",
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": -10.5,
									"kind": 1,
									"args": [
										24,
										280,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3398232730211573,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.4183754994839006,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3398232730211573,
															"value": -2.425986213684083,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1803902618828348,
																"dt": -0.47465505272181074
															},
															"nextHandle": {
																"dv": 0.9145786525067239,
																"dt": 0.36814327172597683
															}
														},
														{
															"time": 1.4405272035278038,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01829157305013407,
																"dt": -0.7229200815073025
															},
															"nextHandle": {
																"dv": 0.008386955341055453,
																"dt": 0.3316701041992479
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
												"texture": "Fx/Gradients/vGrad.png",
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
															"time": 0.3398232730211573,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.7393988853224813,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.5605686322174774,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.010995608538952428,
																"dt": -0.6427923963018025
															},
															"nextHandle": {
																"dv": -0.010995608538952428,
																"dt": 0.6427923963018025
															}
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
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.35546875,
																"color": -151464545
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
											}
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
						},
						{
							"type": "polygon",
							"name": "Hit",
							"x": 3.57174,
							"y": 0.68672,
							"z": 0.96457,
							"scaleX": 3.67,
							"scaleY": 2.460000000000001,
							"scaleZ": 0.7199999999999995,
							"rotationX": -6.4,
							"rotationY": -28.7,
							"rotationZ": 98.7,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 15
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatFlash.png"
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"keys": [
												{
													"time": 0.6501683657259777,
													"value": 0.01416666666666666,
													"mode": 1,
													"prevHandle": {
														"dv": 0.3775126578654911,
														"dt": -0.49657530216143814
													},
													"nextHandle": {
														"dv": 0.030303042312934347,
														"dt": 0.10019625091052298
													}
												},
												{
													"time": 0.7118915986649266,
													"value": 0.9419580650329591,
													"mode": 2
												},
												{
													"time": 0.7152464112597599,
													"value": 0.9419580650329591,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.0020841860073189666
													}
												},
												{
													"time": 0.7253108490442597,
													"value": 0.9419580650329591,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -0.6883794651925124,
														"dt": 0.022481199434944754
													}
												},
												{
													"time": 0.8136542473748699,
													"value": 0,
													"mode": 2
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
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.3,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 200,
										"power": 23.48
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": 4284698838
													},
													{
														"position": 1,
														"color": -7839517
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.6829090896200499,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -5.144393148422792,
												"dt": -0.2763891846996204
											},
											"nextHandle": {
												"dv": 2.84594993226079,
												"dt": 0.15278816161334696
											}
										},
										{
											"time": 1.1893062948913615,
											"value": 4,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "FloorStraightImpact",
					"x": 6.96211,
					"y": -0.60171,
					"z": 0.15,
					"scaleX": 1.5,
					"scaleY": 0.375,
					"scaleZ": 1.2,
					"rotationX": 180,
					"rotationY": 90,
					"children": [
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
							"z": 1.88256,
							"scaleY": 1.8,
							"scaleZ": 1.8,
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
											"emissive": 0.1
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_MissileHead.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.2307883345609325,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.005820468895116893
													}
												},
												{
													"time": 1.2370778561237323,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -1.124604999922227,
														"dt": 0.06682227758749892
													}
												},
												{
													"time": 1.7370778561237323,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.027656293032379653,
														"dt": -0.28596902410700986
													},
													"nextHandle": {
														"dv": 0.027656293032379653,
														"dt": 0.28596902410700986
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
										"progress": 0.3,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 1,
									"keys": [
										{
											"time": 1.2426460098072407,
											"value": 0.2710450124806828,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.7871018058682482,
												"dt": 0.06863200598878672
											}
										},
										{
											"time": 1.7370778561237323,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016418796802560642,
												"dt": -0.40563803898909634
											},
											"nextHandle": {
												"dv": -0.007231640352717618,
												"dt": 0.16666332862669664
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
					"name": "Slashtrail",
					"x": 1.31632,
					"y": -0.19743,
					"z": 2.93608,
					"scaleX": 4,
					"scaleY": 4,
					"scaleZ": 4,
					"rotationX": 6.7,
					"rotationY": -175.3,
					"rotationZ": -47.6,
					"kind": 1,
					"args": [
						24,
						289.09,
						0.36,
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
									"emissive": 4
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 5
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0.7736698065318488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7956399820763591,
											"value": 5,
											"mode": 2
										},
										{
											"time": 0.9001899968046106,
											"value": 5,
											"mode": 2
										},
										{
											"time": 0.9983289117095218,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.6,
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
									"keys": [
										{
											"time": 0.5712701214166193,
											"value": -0.82,
											"mode": 2
										},
										{
											"time": 0.8715661466240114,
											"value": -0.36,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scaleX",
									"keys": [
										{
											"time": 0.8501296737774505,
											"value": 2,
											"mode": 2
										},
										{
											"time": 0.9741276737440367,
											"value": 10.237397941946988,
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
								"progress": 0.18,
								"saturation": 1,
								"width": 0.44,
								"uvScaleX": 1,
								"uvScaleY": 4,
								"texture": "Fx/Gradients/uGrad_uneaven.png",
								"uvShift": [
									0.1,
									0.5
								],
								"uvShiftSpeed": [
									0,
									0.5
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
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0.1303960830617601,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.4790970682520839,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 0.5010672437965942,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04715950531536345,
												"dt": -0.6125145314162203
											},
											"nextHandle": {
												"dv": -0.04715950531536345,
												"dt": 0.6125145314162203
											}
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
									0.21568627450980393,
									0.13333333333333333,
									0.09411764705882353
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Step1",
					"x": 0.80326,
					"children": [
						{
							"type": "polygon",
							"name": "Back_Sand_Stylised1",
							"x": 3.36615,
							"y": -0.3,
							"z": 0.24179,
							"scaleX": 4,
							"scaleY": 4.45,
							"scaleZ": 0.05,
							"rotationX": -12,
							"rotationZ": 90,
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
											"culling": "None",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 0.5,
											"drawOrder": "100"
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_FlatSmoke.png"
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
										"progress": 0.5,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											1
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
													"time": 0.30291220152369885,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": -0.5337762368520101,
														"dt": 0.42926778498909995
													}
												},
												{
													"time": 0.9968012603678705,
													"value": 0,
													"mode": 2
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
									}
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.30291220152369885,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6465376795391293,
											"value": 3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4665023907761046
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.4665023907761046
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.30291220152369885,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.216730645116172,
												"dt": -0.5298503198629724
											},
											"nextHandle": {
												"dv": 0.9,
												"dt": 0.14824532747268693
											}
										},
										{
											"time": 1.4568058109135187,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Floor1",
							"props": {
								"instScale_rand": 1,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 10,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cylinder",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.45,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0,
									0,
									2
								],
								"instSpeed": [
									10,
									0,
									0
								],
								"warmUpTime": -0.3
							},
							"x": 0.59571,
							"y": -0.38159,
							"z": 0.26608,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.01,
							"rotationZ": 2.0999999999999996,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9098039215686274,
													0.9098039215686274,
													0.9098039215686274
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
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 28.79,
												"power": 38.64
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topIntensity": 0.4,
											"topSpan": 0.5,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.7,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.4,
												"envColorSet": false
											}
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
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05166666666666666
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.040734981627899014,
												"dt": -0.6732812499999992
											},
											"nextHandle": {
												"dv": 0.016048606913192237,
												"dt": 0.2659338296837626
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.0368041795619947,
												"dt": -0.22469329683007053
											},
											"nextHandle": {
												"dv": -1.0041624617719014,
												"dt": 0.2179870466083442
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024279651221022422,
												"dt": -0.3496719776184397
											},
											"nextHandle": {
												"dv": 0.024279651221022422,
												"dt": 0.3496719776184397
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"keys": [
										{
											"time": 0.1424731182795699,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5456989247311828,
											"value": 3.543997192382814,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sand_Floor1",
					"props": {
						"instScale_rand": 1,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9215686274509803,
							0.9215686274509803,
							0.9215686274509803,
							0.8509803921568627
						],
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 10,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 3,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.45,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						],
						"instSpeed": [
							10,
							0,
							0
						],
						"warmUpTime": -1.15
					},
					"x": 1.48407,
					"y": -0.75356,
					"z": 0.26608,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.01,
					"rotationZ": 180,
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
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.6472728746925278,
														"dt": -0.012445056058803479
													},
													"nextHandle": {
														"dv": 0.9454545454545454,
														"dt": 0.007142857142857143
													}
												},
												{
													"time": 0.45,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 8.922912650454184e-17,
														"dt": -0.21499999999999997
													},
													"nextHandle": {
														"dv": 0,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9098039215686274,
											0.9098039215686274,
											0.9098039215686274
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
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1116321015082125,
														"dt": -0.3076091494743911
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.2774350174349862
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 28.79,
										"power": 38.64
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.7,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
									}
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
									"value": 0.2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.05166666666666666
									}
								},
								{
									"time": 1,
									"value": 1.01469963255798,
									"mode": 0,
									"prevHandle": {
										"dv": -0.040734981627899014,
										"dt": -0.6732812499999992
									},
									"nextHandle": {
										"dv": 0.016048606913192237,
										"dt": 0.2659338296837626
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.0368041795619947,
										"dt": -0.22469329683007053
									},
									"nextHandle": {
										"dv": -1.0041624617719014,
										"dt": 0.2179870466083442
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.024279651221022422,
										"dt": -0.3496719776184397
									},
									"nextHandle": {
										"dv": 0.024279651221022422,
										"dt": 0.3496719776184397
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"enabled": false,
							"keys": [
								{
									"time": 0.1424731182795699,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.5456989247311828,
									"value": 3.543997192382814,
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