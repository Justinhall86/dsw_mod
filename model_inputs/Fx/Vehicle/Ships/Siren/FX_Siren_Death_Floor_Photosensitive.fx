{
	"type": "fx",
	"duration": 25,
	"cullingRadius": 20,
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
					"type": "object",
					"name": "DeathFloor",
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid_photosensitive",
							"source": "Fx/Explosion/FX_Explosion_Mid_Photosensitive.fx",
							"time": 0.695
						},
						{
							"type": "subFX",
							"name": "FX_LensFlare_MidExplosion",
							"source": "Fx/Explosion/FX_LensFlare_MidExplosion.fx",
							"enabled": false,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"time": 1.72414
						},
						{
							"type": "subFX",
							"name": "FX_DeathFloor_Dust",
							"source": "Fx/Vehicle/Ships/FX_DeathFloor_Dust.fx",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"time": -2
						},
						{
							"type": "object",
							"name": "DeathFloor",
							"enabled": false,
							"children": [
								{
									"type": "object",
									"name": "Planes",
									"enabled": false,
									"z": -2.220446049250313e-16,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"x": -2.964925,
											"y": -10.6116675,
											"z": -0.4757125,
											"scaleX": 16.500844648658845,
											"scaleY": 19.805436199371798,
											"scaleZ": 14.651053968246973,
											"rotationX": 8.18,
											"rotationY": 21.82,
											"rotationZ": -89.11417778289012,
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
														"uOffset": 0.01,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_90_01.png"
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5972972669996786,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7,
																"dt": 0.12960920751304128
															}
														},
														{
															"time": 2.5972972669996786,
															"value": 1.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666607,
																"dt": -0.915441604254537
															},
															"nextHandle": {
																"dv": -0.006044687257184451,
																"dt": 0.3333173150083603
															}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.5647235521494385,
																	"value": -0.006821632385254017,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 2.573861735743188,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -0.6501693725585938,
																		"dt": 0.5496199035644533
																	}
																},
																{
																	"time": 4.601148265284205,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666607,
																		"dt": -0.915441604254537
																	},
																	"nextHandle": {
																		"dv": -0.006044687257184451,
																		"dt": 0.3333173150083603
																	}
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
														"range": 12,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"x": 2.770045,
											"y": 9.2204525,
											"z": 0.5823575000000001,
											"scaleX": 16.02902861617923,
											"scaleY": 9.614341428081406,
											"scaleZ": 21.05498875293422,
											"rotationX": 10.899199023839143,
											"rotationY": -26.73085003255992,
											"rotationZ": -88.7526472091256,
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
														"uOffset": 0.01,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_90_01.png"
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5972972669996786,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7,
																"dt": 0.12960920751304128
															}
														},
														{
															"time": 2.5972972669996786,
															"value": 1.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666607,
																"dt": -0.915441604254537
															},
															"nextHandle": {
																"dv": -0.006044687257184451,
																"dt": 0.3333173150083603
															}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.5647235521494385,
																	"value": -0.006821632385254017,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 2.573861735743188,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -0.6501693725585938,
																		"dt": 0.5496199035644533
																	}
																},
																{
																	"time": 4.601148265284205,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666607,
																		"dt": -0.915441604254537
																	},
																	"nextHandle": {
																		"dv": -0.006044687257184451,
																		"dt": 0.3333173150083603
																	}
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
														"range": 12,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"x": 3.681465,
											"y": -8.6116675,
											"z": -0.22796250000000007,
											"scaleX": 15.753466051595304,
											"scaleY": 9.887201135660474,
											"scaleZ": 21.581147801327926,
											"rotationY": 19.09,
											"rotationZ": -81.58562073333785,
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
														"uOffset": 0.01,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_90_01.png"
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5972972669996786,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7,
																"dt": 0.12960920751304128
															}
														},
														{
															"time": 2.5972972669996786,
															"value": 1.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666607,
																"dt": -0.915441604254537
															},
															"nextHandle": {
																"dv": -0.006044687257184451,
																"dt": 0.3333173150083603
															}
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.5647235521494385,
																	"value": -0.006821632385254017,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 2.573861735743188,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -0.6501693725585938,
																		"dt": 0.5496199035644533
																	}
																},
																{
																	"time": 4.601148265284205,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666607,
																		"dt": -0.915441604254537
																	},
																	"nextHandle": {
																		"dv": -0.006044687257184451,
																		"dt": 0.3333173150083603
																	}
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
														"range": 12,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "object",
											"name": "group",
											"x": -3.4865849999999985,
											"y": 10.0028825,
											"z": 0.12131750000000006,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
													"y": 1.7763568394002505e-15,
													"scaleX": 20.129118995337222,
													"scaleY": 18.750930359018533,
													"scaleZ": 18.626427027513724,
													"rotationX": 12.722275307928468,
													"rotationY": -31.699520088147683,
													"rotationZ": -75.67485257951702,
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
																"uOffset": 0.01,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_JetSand_90_01.png"
															}
														},
														{
															"type": "curve",
															"name": "scale.z",
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.5972972669996786,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0.7,
																		"dt": 0.12960920751304128
																	}
																},
																{
																	"time": 2.5972972669996786,
																	"value": 1.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666607,
																		"dt": -0.915441604254537
																	},
																	"nextHandle": {
																		"dv": -0.006044687257184451,
																		"dt": 0.3333173150083603
																	}
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
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
																	"keyMode": 1,
																	"keys": [
																		{
																			"time": 1.5647235521494385,
																			"value": -0.006821632385254017,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3063455200195313
																			}
																		},
																		{
																			"time": 2.573861735743188,
																			"value": 1,
																			"mode": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": -0.6501693725585938,
																				"dt": 0.5496199035644533
																			}
																		},
																		{
																			"time": 4.601148265284205,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666607,
																				"dt": -0.915441604254537
																			},
																			"nextHandle": {
																				"dv": -0.006044687257184451,
																				"dt": 0.3333173150083603
																			}
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
																"range": 12,
																"power": 0.8
															},
															"isInstance": true
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
									"type": "model",
									"name": "CylinderCone_BottomPiv01",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv01.fbx",
									"x": -1.44899,
									"y": 1.58418,
									"z": 0.0708,
									"scaleX": 350,
									"scaleY": 350,
									"scaleZ": 120,
									"rotationZ": 165.7,
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
												"uScale": 3,
												"vScale": 1,
												"uOffset": 0.01,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.5972972669996786,
													"value": 0.19388888888888886,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 1.2722222222222224,
														"dt": 0.15602594777414103
													}
												},
												{
													"time": 2.5972972669996786,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.5972972669996786,
													"value": -2.986805964684985,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 3.534616658251625,
														"dt": 0.07613831928324766
													}
												},
												{
													"time": 2.5972972669996786,
													"value": 0.013194035315015312,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.915441604254537
													},
													"nextHandle": {
														"dv": -0.006044687257184451,
														"dt": 0.3333173150083603
													}
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
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.5647235521494385,
															"value": -0.006821632385254017,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3063455200195313
															}
														},
														{
															"time": 2.573861735743188,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -0.6501693725585938,
																"dt": 0.5496199035644533
															}
														},
														{
															"time": 4.601148265284205,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666607,
																"dt": -0.915441604254537
															},
															"nextHandle": {
																"dv": -0.006044687257184451,
																"dt": 0.3333173150083603
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
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "SandShockWave",
									"y": 2.5,
									"z": 2.19055,
									"children": [
										{
											"type": "emitter",
											"name": "Impact_Burst_Mid_SandJet_L",
											"props": {
												"instScale_rand": 3.5,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 10,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													1,
													0,
													0
												],
												"emitRate": 20,
												"maxCount": 100,
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"alignMode": "Screen",
												"instStretch_rand": [
													0,
													0.25,
													0
												],
												"instStretch": [
													1,
													2,
													1
												],
												"warmUpTime": -1.9,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													-30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 3,
												"instSpeed": [
													1,
													0,
													0
												],
												"emitRad2": 0.9,
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 18,
											"scaleY": 18,
											"scaleZ": 0.12,
											"rotationZ": -90,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 2.5,
													"scaleY": 2.5,
													"scaleZ": 2.5,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false
																}
															},
															"color": [
																1,
																0.7764705882352941,
																0.5647058823529412,
																0.27058823529411763
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.15,
																			"value": 1,
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
																	1,
																	1
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
																"progress": 0.58,
																"saturation": 0,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.02
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
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1946815774171073,
																				"dt": -0.37422467067608545
																			},
																			"nextHandle": {
																				"dv": -1.0693652343750002,
																				"dt": 0.3379705070727756
																			}
																		},
																		{
																			"time": 1.5,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.3,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
															"envBlend": 0.7
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
															"value": -0.004801283442754212,
															"mode": 0,
															"prevHandle": {
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Impact_Burst_Mid_SandJet_R",
											"props": {
												"instScale_rand": 3.5,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 10,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													1,
													0,
													0
												],
												"emitRate": 20,
												"maxCount": 100,
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"alignMode": "Screen",
												"instStretch_rand": [
													0,
													0.25,
													0
												],
												"instStretch": [
													1,
													2,
													1
												],
												"warmUpTime": -1.9,
												"emitType": "Burst",
												"burstParticleCount": 8,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 2,
												"instSpeed": [
													2,
													0,
													0
												],
												"emitRad2": 0.9,
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 18,
											"scaleY": 18,
											"scaleZ": 0.12,
											"rotationZ": 90,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 2.5,
													"scaleY": 2.5,
													"scaleZ": 2.5,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false
																}
															},
															"color": [
																1,
																0.7764705882352941,
																0.5647058823529412,
																0.27058823529411763
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.15,
																			"value": 1,
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
																	1,
																	1
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
																"progress": 0.58,
																"saturation": 0,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.02
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
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1946815774171073,
																				"dt": -0.37422467067608545
																			},
																			"nextHandle": {
																				"dv": -1.0693652343750002,
																				"dt": 0.3379705070727756
																			}
																		},
																		{
																			"time": 1.5,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.3,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
															"envBlend": 0.7
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
															"value": -0.004801283442754212,
															"mode": 0,
															"prevHandle": {
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Impact_Burst_Far_SandJet_R",
											"enabled": false,
											"props": {
												"instScale_rand": 4,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 13,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													0.5,
													0,
													0
												],
												"emitRate": 20,
												"maxCount": 100,
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"alignMode": "Screen",
												"instStretch_rand": [
													0,
													0.25,
													0
												],
												"instStretch": [
													1,
													2,
													1
												],
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"burstParticleCount": 13,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 5,
												"instSpeed": [
													3,
													0,
													0
												],
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 50,
											"scaleY": 50,
											"scaleZ": 0.16,
											"rotationZ": 90,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 2.5,
													"scaleY": 2.5,
													"scaleZ": 2.5,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false
																}
															},
															"color": [
																1,
																0.7764705882352941,
																0.5647058823529412,
																0.27058823529411763
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.15,
																			"value": 1,
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
																	1,
																	1
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
																"progress": 0.58,
																"saturation": 0,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.02
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
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1946815774171073,
																				"dt": -0.37422467067608545
																			},
																			"nextHandle": {
																				"dv": -1.0693652343750002,
																				"dt": 0.3379705070727756
																			}
																		},
																		{
																			"time": 1.5,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.3,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
															"envBlend": 0.7
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
															"value": -0.004801283442754212,
															"mode": 0,
															"prevHandle": {
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Impact_Burst_Far_SandJet_L",
											"enabled": false,
											"props": {
												"instScale_rand": 4,
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
													15
												],
												"lifeTimeRand": 3,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 13,
												"lifeTime": 5,
												"emitRad1": 0.8,
												"randomColor2": [
													0.8431372549019608,
													0.7607843137254902,
													0.7254901960784313,
													1
												],
												"instSpeed_rand": [
													0.5,
													0,
													0
												],
												"emitRate": 20,
												"maxCount": 100,
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
												"instWorldAcceleration_rand": [
													0,
													0,
													0
												],
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"alignMode": "Screen",
												"instStretch_rand": [
													0,
													0.25,
													0
												],
												"instStretch": [
													1,
													2,
													1
												],
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"burstParticleCount": 13,
												"emitAngle": 180,
												"instRotation": [
													0,
													0,
													-30
												],
												"emitDuration": 20,
												"burstDelay": 1.35,
												"seedGroup": 4,
												"instSpeed": [
													3,
													0,
													0
												],
												"useRandomColor": true
											},
											"x": -0.7514,
											"z": -0.32935,
											"scaleX": 50,
											"scaleY": 50,
											"scaleZ": 0.16,
											"rotationZ": -90,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 2.5,
													"scaleY": 2.5,
													"scaleZ": 2.5,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false
																}
															},
															"color": [
																1,
																0.7764705882352941,
																0.5647058823529412,
																0.27058823529411763
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 0.7
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.15,
																			"value": 1,
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
																	1,
																	1
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
																"progress": 0.58,
																"saturation": 0,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/Wave_01.jpg",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	0.02
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
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1946815774171073,
																				"dt": -0.37422467067608545
																			},
																			"nextHandle": {
																				"dv": -1.0693652343750002,
																				"dt": 0.3379705070727756
																			}
																		},
																		{
																			"time": 1.5,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.51,
															"topSpan": 0.3,
															"dirIntensity": 0.1,
															"dirSpan": 0,
															"sandBlend": 0.7,
															"envBlend": 0.7
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
															"value": -0.004801283442754212,
															"mode": 0,
															"prevHandle": {
																"dv": -1.388476860780481,
																"dt": -0.06199247660355442
															},
															"nextHandle": {
																"dv": 0.7972549709272361,
																"dt": 0.03559570312500002
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.92880859375
															},
															"nextHandle": {
																"dv": -2.5729900539317147e-16,
																"dt": 0.42212406308208533
															}
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
												"range": 3,
												"power": 0.8
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort_Chockwave",
									"props": {
										"instScale_rand": 0,
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
											0.9098039215686274,
											0.615686274509804,
											1,
											0.8509803921568627
										],
										"emitRate": 10,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"emitType": "Burst",
										"burstDelay": 0.3,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -2.1,
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 0.25,
										"instOffset": [
											0,
											0,
											25
										]
									},
									"z": -20,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.05,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/DiskFlat.fbx",
											"scaleX": 200,
											"scaleY": 200,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
															"shadows": false,
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None",
															"depthWrite": "On",
															"drawOrder": "-100",
															"emissive": 2.2
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
														"intensity": 0.04
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8043636363636364,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5969588995728569,
																		"dt": -0.2623791435549754
																	},
																	"nextHandle": {
																		"dv": -0.5969588995728569,
																		"dt": 0.2623791435549754
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.08425454545454536,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -0.08425454545454536,
																		"dt": 0.2350000000000001
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1.75,
														"scaleY": 1.75,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
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
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
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
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5350976805491343,
																	"value": 0.9422222222222223,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03695353771889259
																	},
																	"nextHandle": {
																		"dv": -6.922428196740585e-16,
																		"dt": 0.24478506621704163
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": -0.8474237452673484,
																		"dt": 0.3135467857489186
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 0.0402048299726524,
													"mode": 0,
													"prevHandle": {
														"dv": -0.9239350146379692,
														"dt": -0.3456633226416698
													},
													"nextHandle": {
														"dv": 0.12028199966650588,
														"dt": 0.045000000000000005
													}
												},
												{
													"time": 1,
													"value": 1.0158254939343108,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026729333259223442,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.0103433736750329,
														"dt": 0.33472657705803693
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "ShockWave3",
									"props": {
										"emitType": "Burst",
										"instScale": 60,
										"emitDuration": 20,
										"burstDelay": 1.35,
										"speedFactor": 0.5,
										"lifeTime": 15,
										"warmUpTime": -1
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
															"colorMask": 255,
															"depthTest": "LessEqual"
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_BlurCircle.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.286550392695083,
																		"dt": -0.31785362643054976
																	},
																	"nextHandle": {
																		"dv": -0.85,
																		"dt": 0.21000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.815
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.28500000000000003,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.36,
																	"value": 0.6,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6499999999999999
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.41000000000000025,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.42000000000000026,
																	"value": 0.35,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.405
																	},
																	"nextHandle": {
																		"dv": 0.013714721486098064,
																		"dt": 0.33326773211218813
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.4600000000000005,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.47000000000000053,
																	"value": 0.35,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.405
																	},
																	"nextHandle": {
																		"dv": 0.013714721486098064,
																		"dt": 0.33326773211218813
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
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
														"progress": 0.64,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 3,
														"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.0049999999999999975,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 0.4,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.8949999999999999
																	},
																	"nextHandle": {
																		"dv": -1.347456942463063e-16,
																		"dt": 0.33008462768233626
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.0006153761397992286,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5609260576910832,
														"dt": -0.42893757473558736
													},
													"nextHandle": {
														"dv": 1.1875,
														"dt": 0.0020001101826084625
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010416666666666519,
														"dt": -0.98203833016689
													},
													"nextHandle": {
														"dv": -0.0008405810382348004,
														"dt": 0.0792558235752288
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
					"type": "model",
					"name": "Siren",
					"source": "Vehicle/Ecaz/Siren/Siren.fbx",
					"editorOnly": true,
					"x": -5.9745,
					"z": 1.37806,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -2,
							"animation": "Anim/Siren/Anim_Siren_Death.fbx"
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
				}
			]
		}
	]
}