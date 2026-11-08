{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"x": 0.51175,
			"y": -1,
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"rotationZ": 180,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": -155.45,
					"children": [
						{
							"type": "model",
							"name": "Knife01",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"y": -0.11946,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Knife02",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"x": -0.10327,
							"y": 0.13531,
							"rotationX": -90,
							"rotationZ": -166.5
						},
						{
							"type": "model",
							"name": "Male01_HouseGuard",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -0.00415,
							"y": -0.01523,
							"scaleX": 1.9999999999999996,
							"scaleY": 1.9999999999999996,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Male01/Cerberus_2Swords/Anim_Male01_Cerberus_2Swords_AttackMelee02.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Attack",
					"children": [
						{
							"type": "object",
							"name": "Attack01",
							"z": 0.185,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -9.3,
							"children": [
								{
									"type": "object",
									"name": "Slash01",
									"x": -1.6462,
									"y": -0.97732,
									"z": 1.2287,
									"rotationX": 21.5,
									"rotationY": -165.8,
									"rotationZ": 13.5,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.25625000000000014,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.501249999999995,
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
																	"time": 0.2512500000000002,
																	"value": -0.03472222222222225,
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
																	"time": 0.71625,
																	"value": 1.0069444444444449,
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
																	"time": 1.13125,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6957690384115582,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7057690384115582,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7157690384115583,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.79125,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.25625000000000014,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.501249999999995,
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
																	"time": 0.2512500000000002,
																	"value": -0.03472222222222225,
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
																	"time": 0.71625,
																	"value": 1.0069444444444449,
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
																	"time": 1.13125,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6565746731259376,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6665746731259377,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6910260830360422,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7010260830360422,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.79125,
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
																	"time": 0.25625000000000014,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.501249999999995,
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
																	"time": 0.2512500000000002,
																	"value": -0.03472222222222225,
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
																	"time": 0.71625,
																	"value": 1.0069444444444449,
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
																	"time": 1.13125,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.25625000000000014,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.501249999999995,
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
																	"time": 0.2512500000000002,
																	"value": -0.03472222222222225,
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
																	"time": 0.71625,
																	"value": 1.0069444444444449,
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
																	"time": 1.13125,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash03",
									"x": -1.94342,
									"y": -0.90753,
									"z": 1.05718,
									"rotationX": -113.3,
									"rotationY": 11.4,
									"rotationZ": -60.7,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.48180555555555404,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.726805555555549,
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
																	"time": 0.5118055555555538,
																	"value": -0.03472222222222225,
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
																	"time": 0.9768055555555537,
																	"value": 1.0069444444444449,
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
																	"time": 1.3918055555555537,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9413245939671122,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9513245939671122,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9613245939671122,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.0518055555555534,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.48180555555555404,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.726805555555549,
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
																	"time": 0.47680555555555415,
																	"value": -0.03472222222222225,
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
																	"time": 0.941805555555554,
																	"value": 1.0069444444444449,
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
																	"time": 1.356805555555554,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9021302286814916,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9121302286814916,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9365816385915962,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9465816385915962,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.0518055555555534,
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
																	"time": 0.48180555555555404,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.726805555555549,
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
																	"time": 0.47680555555555415,
																	"value": -0.03472222222222225,
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
																	"time": 0.941805555555554,
																	"value": 1.0069444444444449,
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
																	"time": 1.356805555555554,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.48180555555555404,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.726805555555549,
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
																	"time": 0.47680555555555415,
																	"value": -0.03472222222222225,
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
																	"time": 0.941805555555554,
																	"value": 1.0069444444444449,
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
																	"time": 1.356805555555554,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand",
									"props": {
										"instScale_rand": 0.9,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											30
										],
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRate": 1,
										"speedFactor": 2.5,
										"maxCount": 4,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -1.75,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											5,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": -3.60846,
									"y": -4.05733,
									"z": -0.92916,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -138.8,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.25,
											"scaleY": 2.25,
											"scaleZ": 2.25,
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
														"alpha": 1
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
															0.8745098039215686,
															0.8745098039215686,
															0.8745098039215686
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
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
														"range": 1.7,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.57,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0967980860793232,
														"dt": -0.009802037467223067
													},
													"nextHandle": {
														"dv": 0.5569361461292616,
														"dt": 0.0049999999999999975
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010970089074337164,
														"dt": -0.575
													},
													"nextHandle": {
														"dv": -0.006359231507065358,
														"dt": 0.3333207316535249
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
													}
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
					"type": "object",
					"name": "Attack",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "Attack01",
							"z": 0.185,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -9.3,
							"children": [
								{
									"type": "object",
									"name": "Slash01",
									"enabled": false,
									"x": -1.63303,
									"y": -0.93776,
									"z": 1.31581,
									"rotationX": 23.7,
									"rotationY": -168.5,
									"rotationZ": -5.6,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7757690384115579,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7857690384115579,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7957690384115579,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.8712499999999996,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"enabled": false,
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7365746731259373,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7465746731259373,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7710260830360418,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7810260830360418,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.8712499999999996,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash01",
									"x": -1.6462,
									"y": -0.97732,
									"z": 1.2287,
									"rotationX": 21.5,
									"rotationY": -165.8,
									"rotationZ": 13.5,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7757690384115579,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7857690384115579,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7957690384115579,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.8712499999999996,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"enabled": false,
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7365746731259373,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7465746731259373,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7710260830360418,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7810260830360418,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.8712499999999996,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.33624999999999977,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5812499999999947,
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
																	"time": 0.3312499999999998,
																	"value": -0.03472222222222225,
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
																	"time": 0.7962499999999997,
																	"value": 1.0069444444444449,
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
																	"time": 1.2112499999999997,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash02",
									"enabled": false,
									"x": -1.66071,
									"y": -1.28127,
									"z": 1.55022,
									"rotationX": 8.3,
									"rotationY": -174,
									"rotationZ": -14.8,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.48624999999999874,
																	"value": -0.03472222222222225,
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
																	"time": 0.9512499999999986,
																	"value": 1.0069444444444449,
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
																	"time": 1.3662499999999986,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9157690384115571,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9257690384115571,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9357690384115571,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.0262499999999983,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.48624999999999874,
																	"value": -0.03472222222222225,
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
																	"time": 0.9512499999999986,
																	"value": 1.0069444444444449,
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
																	"time": 1.3662499999999986,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"enabled": false,
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8765746731259365,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8865746731259365,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.911026083036041,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.921026083036041,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.0262499999999983,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.48624999999999874,
																	"value": -0.03472222222222225,
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
																	"time": 0.9512499999999986,
																	"value": 1.0069444444444449,
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
																	"time": 1.3662499999999986,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.48624999999999874,
																	"value": -0.03472222222222225,
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
																	"time": 0.9512499999999986,
																	"value": 1.0069444444444449,
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
																	"time": 1.3662499999999986,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash02",
									"enabled": false,
									"x": -1.66071,
									"y": -1.28127,
									"z": 1.55022,
									"rotationX": 8.3,
									"rotationY": -174,
									"rotationZ": -14.8,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.43124999999999947,
																	"value": -0.03472222222222225,
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
																	"time": 0.8962499999999993,
																	"value": 1.0069444444444449,
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
																	"time": 1.3112499999999994,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9157690384115571,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9257690384115571,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9357690384115571,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.0262499999999983,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.45624999999999893,
																	"value": -0.03472222222222225,
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
																	"time": 0.9212499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.3362499999999988,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.49124999999999863,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.7362499999999936,
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
																	"time": 0.45624999999999893,
																	"value": -0.03472222222222225,
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
																	"time": 0.9212499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.3362499999999988,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash03",
									"enabled": false,
									"x": -1.81432,
									"y": -1.38903,
									"z": 1.01377,
									"rotationX": -109.5,
									"rotationY": 17.2,
									"rotationZ": -45.6,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5962499999999986,
																	"value": -0.03472222222222225,
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
																	"time": 1.0612499999999985,
																	"value": 1.0069444444444449,
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
																	"time": 1.4762499999999985,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.025769038411557,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.035769038411557,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.045769038411557,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.136249999999998,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"enabled": false,
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9865746731259364,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9965746731259364,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.021026083036041,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.031026083036041,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.136249999999998,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "object",
									"name": "Slash03",
									"x": -1.94342,
									"y": -0.90753,
									"z": 1.05718,
									"rotationX": -113.3,
									"rotationY": 11.4,
									"rotationZ": -60.7,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5962499999999986,
																	"value": -0.03472222222222225,
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
																	"time": 1.0612499999999985,
																	"value": 1.0069444444444449,
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
																	"time": 1.4762499999999985,
																	"value": -0.03472222222222225,
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
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.025769038411557,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.035769038411557,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.045769038411557,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.136249999999998,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"enabled": false,
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9865746731259364,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9965746731259364,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.021026083036041,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.031026083036041,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 2.136249999999998,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": -4.440892098500626e-16,
											"y": 1.1102230246251565e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -8.700000000000003,
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
																	"time": 0.5662499999999988,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.8112499999999938,
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
																	"time": 0.5612499999999989,
																	"value": -0.03472222222222225,
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
																	"time": 1.0262499999999988,
																	"value": 1.0069444444444449,
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
																	"time": 1.4412499999999988,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand",
									"enabled": false,
									"props": {
										"instScale_rand": 0.9,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											30
										],
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRate": 1,
										"speedFactor": 2.5,
										"maxCount": 2,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -2.25,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											4,
											0,
											0
										]
									},
									"x": 0.49126,
									"y": -2.43815,
									"z": -0.66,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -36.4,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.25,
											"scaleY": 2.25,
											"scaleZ": 2.25,
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
														"alpha": 1
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
															0.8745098039215686,
															0.8745098039215686,
															0.8745098039215686
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
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
														"range": 1.7,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.57,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0967980860793232,
														"dt": -0.009802037467223067
													},
													"nextHandle": {
														"dv": 0.5569361461292616,
														"dt": 0.0049999999999999975
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010970089074337164,
														"dt": -0.575
													},
													"nextHandle": {
														"dv": -0.006359231507065358,
														"dt": 0.3333207316535249
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand",
									"props": {
										"instScale_rand": 0.9,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											30
										],
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRate": 1,
										"speedFactor": 2.5,
										"maxCount": 4,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -1.75,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											5,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": -3.60846,
									"y": -4.05733,
									"z": -0.92916,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -138.8,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.25,
											"scaleY": 2.25,
											"scaleZ": 2.25,
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
														"alpha": 1
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
															0.8745098039215686,
															0.8745098039215686,
															0.8745098039215686
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
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
														"range": 1.7,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.57,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0967980860793232,
														"dt": -0.009802037467223067
													},
													"nextHandle": {
														"dv": 0.5569361461292616,
														"dt": 0.0049999999999999975
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010970089074337164,
														"dt": -0.575
													},
													"nextHandle": {
														"dv": -0.006359231507065358,
														"dt": 0.3333207316535249
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
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
							"name": "Attack02",
							"enabled": false,
							"z": -0.185,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": -5.600000000000001,
							"rotationY": -2.0000000000000013,
							"rotationZ": -29.00000000000003,
							"children": [
								{
									"type": "object",
									"name": "Slashes",
									"x": 1.94,
									"y": -0.17,
									"z": 2.43,
									"rotationX": -0.7,
									"rotationY": 1.3,
									"rotationZ": -13.8,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
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
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
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
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
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
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
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
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7007690384115581,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7107690384115581,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7207690384115581,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
															0.9921568627450981,
															0.8235294117647058,
															0.6627450980392157
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
														"envBlend": 0.5,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
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
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
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
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
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
											"name": "SlashContrast",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
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
															"emissive": 3
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
																	"time": -0.10499999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6615746731259375,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6715746731259375,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6960260830360421,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7060260830360421,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.7912499999999996,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
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
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
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
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
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
											"name": "SlashDistort",
											"x": 4.440892098500626e-16,
											"y": -2.220446049250313e-16,
											"z": 2.220446049250313e-16,
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": -179.8,
											"rotationZ": 8.300000000000002,
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
																	"time": 0.2562499999999997,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5012499999999946,
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
																	"time": 0.25124999999999975,
																	"value": -0.03472222222222225,
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
																	"time": 0.7162499999999996,
																	"value": 1.0069444444444449,
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
																	"time": 1.1312499999999996,
																	"value": -0.03472222222222225,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand",
									"props": {
										"instScale_rand": 0.9,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											30
										],
										"lifeTimeRand": 0.9,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 5,
										"emitAngle": 45,
										"alignMode": "Screen",
										"lifeTime": 4.5,
										"emitRad1": 0.64,
										"emitRad2": 0.89,
										"randomColor2": [
											0.807843137254902,
											0.788235294117647,
											0.7803921568627451,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"emitRate": 1,
										"speedFactor": 2.5,
										"maxCount": 2,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"warmUpTime": -1.75,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											4,
											0,
											0
										]
									},
									"x": 0.31,
									"y": 0.24,
									"z": -0.64,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": 66.2,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.25,
											"scaleY": 2.25,
											"scaleZ": 2.25,
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
														"alpha": 1
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
															0.8745098039215686,
															0.8745098039215686,
															0.8745098039215686
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
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
														"range": 1.7,
														"power": 1
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.57,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.6,
													"envBlend": 0.5
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
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0967980860793232,
														"dt": -0.009802037467223067
													},
													"nextHandle": {
														"dv": 0.5569361461292616,
														"dt": 0.0049999999999999975
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010970089074337164,
														"dt": -0.575
													},
													"nextHandle": {
														"dv": -0.006359231507065358,
														"dt": 0.3333207316535249
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
														"dv": 3.0890297805850073,
														"dt": -0.11575828486016804
													},
													"nextHandle": {
														"dv": -0.9363636363636363,
														"dt": 0.03508928571428571
													}
												},
												{
													"time": 0.6549999999999999,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.009090909090909038,
														"dt": -0.6245892857142856
													},
													"nextHandle": {
														"dv": 0.008774267419493307,
														"dt": 0.6028344762228577
													}
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
					"editorOnly": true,
					"object": "FXAnimation.FXRoot.Chara.Knife01",
					"target": "FXAnimation.FXRoot.Chara.Male01_HouseGuard.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"editorOnly": true,
					"object": "FXAnimation.FXRoot.Chara.Knife02",
					"target": "FXAnimation.FXRoot.Chara.Male01_HouseGuard.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
				}
			]
		},
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
		}
	]
}