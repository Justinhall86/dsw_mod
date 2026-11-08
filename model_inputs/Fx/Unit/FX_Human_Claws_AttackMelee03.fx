{
	"type": "fx",
	"duration": 2,
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
			"children": [
				{
					"type": "model",
					"name": "Female01_Infiltrator",
					"source": "Character/Harkonnen/Unit/Cerberus/Male01_Cerberus.fbx",
					"editorOnly": true,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Claws/Anim_Male01_Claws_AttackMelee03.fbx"
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
							"x": 0.57753,
							"z": 0.09673,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "SlashL",
									"x": 1.79371,
									"y": 0.11598,
									"z": 2.01703,
									"rotationX": 147.9,
									"rotationY": 35.4,
									"rotationZ": -4.2,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 9.6,
											"rotationY": 9.1,
											"rotationZ": -3.3,
											"kind": 1,
											"args": [
												24,
												360,
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
																	"time": 0.06657500369351094,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.585950003693505,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.10846878152467525,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.009470567645967806,
																		"dt": -0.4997450715126867
																	},
																	"nextHandle": {
																		"dv": 0.0070670616006630604,
																		"dt": 0.4176048088699997
																	}
																},
																{
																	"time": 0.5423439076233763,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9762678616087629,
																		"dt": -0.043285321294840085
																	},
																	"nextHandle": {
																		"dv": -1.027650380640803,
																		"dt": 0.05102125792538481
																	}
																},
																{
																	"time": 0.9711715126975609,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015351971896301608,
																		"dt": -0.41489308933188285
																	},
																	"nextHandle": {
																		"dv": -0.015351971896301608,
																		"dt": 0.41489308933188285
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.5006677095791856,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5106677095791856,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5267710006986184,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5367710006986184,
																	"value": 0,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashImpact",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 13.1,
											"rotationY": 2,
											"rotationZ": 31.4,
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
																	"time": 0.5267412992747167,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5367412992747167,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5467412992747167,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.6015750036935108,
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
																	"time": 0.05625137510868733,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5756263751086814,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.10846878152467525,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.009470567645967806,
																		"dt": -0.4997450715126867
																	},
																	"nextHandle": {
																		"dv": 0.0070670616006630604,
																		"dt": 0.4176048088699997
																	}
																},
																{
																	"time": 0.5423439076233763,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9735635185018134,
																		"dt": -0.024906889141887878
																	},
																	"nextHandle": {
																		"dv": -1.027650380640803,
																		"dt": 0.05102125792538481
																	}
																},
																{
																	"time": 0.9843541923364278,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015351971896301608,
																		"dt": -0.41489308933188285
																	},
																	"nextHandle": {
																		"dv": -0.015351971896301608,
																		"dt": 0.41489308933188285
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
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
									"type": "object",
									"name": "SlashR",
									"x": 1.34785,
									"y": -0.21239,
									"z": 1.78974,
									"rotationX": 12.1,
									"rotationY": 17.5,
									"rotationZ": 13.5,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 9.6,
											"rotationY": 9.1,
											"rotationZ": -3.3,
											"kind": 1,
											"args": [
												24,
												360,
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
																	"time": 0.06657500369351094,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.585950003693505,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.10846878152467525,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.009470567645967806,
																		"dt": -0.4997450715126867
																	},
																	"nextHandle": {
																		"dv": 0.0070670616006630604,
																		"dt": 0.4176048088699997
																	}
																},
																{
																	"time": 0.5423439076233763,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.027650380640803,
																		"dt": -0.045168561243249694
																	},
																	"nextHandle": {
																		"dv": -1.027650380640803,
																		"dt": 0.05102125792538481
																	}
																},
																{
																	"time": 0.9711715126975609,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015351971896301608,
																		"dt": -0.41489308933188285
																	},
																	"nextHandle": {
																		"dv": -0.015351971896301608,
																		"dt": 0.41489308933188285
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.5006677095791856,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5106677095791856,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5267710006986184,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5367710006986184,
																	"value": 0,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashImpact",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 13.1,
											"rotationY": 2,
											"rotationZ": 31.4,
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
																	"time": 0.5267412992747167,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5367412992747167,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5467412992747167,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.6015750036935108,
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
																	"time": 0.05625137510868733,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.5756263751086814,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.10846878152467525,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.009470567645967806,
																		"dt": -0.4997450715126867
																	},
																	"nextHandle": {
																		"dv": 0.0070670616006630604,
																		"dt": 0.4176048088699997
																	}
																},
																{
																	"time": 0.5423439076233763,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9735635185018134,
																		"dt": -0.024906889141887878
																	},
																	"nextHandle": {
																		"dv": -1.027650380640803,
																		"dt": 0.05102125792538481
																	}
																},
																{
																	"time": 0.9843541923364278,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015351971896301608,
																		"dt": -0.41489308933188285
																	},
																	"nextHandle": {
																		"dv": -0.015351971896301608,
																		"dt": 0.41489308933188285
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
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
									"type": "emitter",
									"name": "SandR",
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
										"emitAngle": 10,
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
										"warmUpTime": -1.2,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											15,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": 1,
									"z": -0.14614,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": 137.5,
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
														"alpha": 0.75
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
									"name": "SandL",
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
										"emitAngle": 10,
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
										"warmUpTime": -1.2,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											15,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": 1,
									"z": -0.14614,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -137.5,
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
														"alpha": 0.75
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
							"x": 0.57753,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Slash01",
									"x": 1.79371,
									"y": 0.11598,
									"z": 2.01703,
									"rotationX": 147.9,
									"rotationY": 35.4,
									"rotationZ": -4.2,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 9.6,
											"rotationY": 9.1,
											"rotationZ": -3.3,
											"kind": 1,
											"args": [
												24,
												360,
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
																	"time": 0.0882687599984458,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.60764375999844,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.08326875999844585,
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
																	"time": 0.5482687599984457,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.8333333333333337,
																		"dt": 0.08437499999999942
																	}
																},
																{
																	"time": 1.1282687599984453,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.08680555555555562,
																		"dt": -0.4156250000000006
																	},
																	"nextHandle": {
																		"dv": -0.04007057611312548,
																		"dt": 0.19156941028162955
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.49756355286533593,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5075635528653359,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5236668439847687,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5336668439847687,
																	"value": 0,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "SlashImpact",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 13.1,
											"rotationY": 2,
											"rotationZ": 31.4,
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
																	"time": 0.5277877984100039,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5377877984100039,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5477877984100039,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.6232687599984457,
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
																	"time": 0.0882687599984458,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.3276437599984405,
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
																	"time": 0.08326875999844585,
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
																	"time": 0.5482687599984457,
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
																	"time": 0.9632687599984457,
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.8,
																"saturation": 1,
																"width": 0.9,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0
																]
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
									"name": "Slash01",
									"x": 1.34785,
									"y": -0.21239,
									"z": 1.78974,
									"rotationX": 12.1,
									"rotationY": 17.5,
									"rotationZ": 13.5,
									"children": [
										{
											"type": "polygon",
											"name": "Slash",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 9.6,
											"rotationY": 9.1,
											"rotationZ": -3.3,
											"kind": 1,
											"args": [
												24,
												360,
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
																	"time": 0.0882687599984458,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.60764375999844,
																	"value": 1.96,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.220446049250313e-16,
																		"dt": -0.8649999999999947
																	},
																	"nextHandle": {
																		"dv": -1.2076907783619122e-15,
																		"dt": 0.3316640059375199
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
																	"time": 0.08326875999844585,
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
																	"time": 0.5482687599984457,
																	"value": 1.0069444444444449,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -1.0046296296296298,
																		"dt": -0.06620842174634933
																	},
																	"nextHandle": {
																		"dv": -0.8333333333333337,
																		"dt": 0.08437499999999942
																	}
																},
																{
																	"time": 1.1282687599984453,
																	"value": -0.03472222222222225,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.08680555555555562,
																		"dt": -0.4156250000000006
																	},
																	"nextHandle": {
																		"dv": -0.04007057611312548,
																		"dt": 0.19156941028162955
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
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.49756355286533593,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5075635528653359,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5236668439847687,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5336668439847687,
																	"value": 0,
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.8,
																"saturation": 1,
																"width": 0.9,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
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
											"type": "polygon",
											"name": "SlashImpact",
											"scaleX": 3.5,
											"scaleY": 3.5000000000000004,
											"scaleZ": 3.5000000000000004,
											"rotationX": 13.1,
											"rotationY": 2,
											"rotationZ": 31.4,
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
																	"time": 0.5277877984100039,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5377877984100039,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5477877984100039,
																	"value": 0.016666666666666663,
																	"mode": 2
																},
																{
																	"time": 1.6232687599984457,
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
																	"time": 0.0882687599984458,
																	"value": -2.500320053100587,
																	"mode": 2
																},
																{
																	"time": 1.3276437599984405,
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
																	"time": 0.08326875999844585,
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
																	"time": 0.5482687599984457,
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
																	"time": 0.9632687599984457,
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.8,
														"saturation": 1,
														"width": 0.9,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.8,
																"saturation": 1,
																"width": 0.9,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0
																]
															}
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
										"emitAngle": 10,
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
										"warmUpTime": -1.2,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											15,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": 1,
									"z": -0.14614,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": 137.5,
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
														"alpha": 0.75
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
										"emitAngle": 10,
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
										"warmUpTime": -1.2,
										"emitType": "Burst",
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instSpeed": [
											15,
											0,
											0
										],
										"burstDelay": 0.75
									},
									"x": 1,
									"z": -0.14614,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.1,
									"rotationZ": -137.5,
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
														"alpha": 0.75
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
				}
			]
		}
	]
}