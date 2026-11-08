{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"x": 0.2159,
					"y": -1.23175,
					"z": 0.44,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "backup",
					"enabled": false,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "targetOK",
							"scaleX": 75.65062747660056,
							"scaleY": 75.65062747660056,
							"scaleZ": 37.82531373830028,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 1.25,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Target2-1.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.75,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4166666666666667
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4166666666666667
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.00914089075238272,
												"dt": -0.5009074885978119
											},
											"nextHandle": {
												"dv": -0.008333333333333304,
												"dt": 0.44962891024828444
											}
										},
										{
											"time": 0.75,
											"value": 0.6,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "RotatingDecals",
							"scaleX": 0.65,
							"scaleY": 0.65,
							"scaleZ": 0.65,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_circle",
									"scaleX": 89,
									"scaleY": 89,
									"scaleZ": 50,
									"rotationZ": 70.20803621729821,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target1.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "uOffset",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0.5,
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
							"name": "growingcircle",
							"scaleX": 65,
							"scaleY": 65,
							"scaleZ": 80,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.25
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
													}
												},
												{
													"time": 0.75,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": -1.938275785748485,
												"dt": -0.3322758489854544
											},
											"nextHandle": {
												"dv": 0.11666666666666664,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 0.75,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.31592592592592583
											},
											"nextHandle": {
												"dv": 0.01764709375778003,
												"dt": 0.16676503601102188
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
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "Backup2",
					"enabled": false,
					"y": 19.40553,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "object",
							"name": "target",
							"z": -0.6,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"children": [
								{
									"type": "advancedDecal",
									"name": "targetOK",
									"scaleX": 90,
									"scaleY": 90,
									"scaleZ": 45,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target2-2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4166666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4166666666666667
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00914089075238272,
														"dt": -0.5009074885978119
													},
													"nextHandle": {
														"dv": -0.008333333333333304,
														"dt": 0.44962891024828444
													}
												},
												{
													"time": 0.99,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4166666666666666
													}
												},
												{
													"time": 1.9949999999999999,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499999999999996
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "RotatingDecals",
									"scaleX": 0.65,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_circle",
											"scaleX": 89,
											"scaleY": 89,
											"scaleZ": 50,
											"rotationZ": 70.20803621729821,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"renderMode": "BeforeTonemapping",
											"children": [
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
														"alpha": 0.75,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_Target1.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.46,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "uOffset",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4,
															"value": 0.5,
															"mode": 2
														}
													]
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 10,
							"rotationZ": 167.9638026188483,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "model",
									"name": "Flag",
									"source": "Fx/Meshes_Common/CurvedPlan.fbx",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 0.35,
									"rotationY": 90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Overlay",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false
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
												"texture": "Fx/Alphas/T_Logo_PillageRaid_02.png",
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
													0.8313725490196078,
													0.8313725490196078,
													0.8313725490196078
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33333333333333326
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33333333333333326
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33333333333333326
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Village",
							"editorOnly": true,
							"z": 0.6,
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 0.096,
									"y": 0.393174,
									"z": -0.8080719999999999,
									"rotationZ": 6.599999999999998,
									"children": [
										{
											"type": "model",
											"name": "Village_Large_01",
											"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
											"x": -0.1421921619706209,
											"y": -0.1848820950609353,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 1.25,
											"rotationZ": 102.20000000000003,
											"children": [
												{
													"type": "shader",
													"name": "WindCloth",
													"source": "shaders/WindCloth.hx",
													"enabled": false,
													"props": {
														"speed": 2,
														"amount": 3.64,
														"zamount": 1,
														"freq": 9.09
													},
													"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
													"recursiveApply": false,
													"isInstance": true
												}
											]
										},
										{
											"type": "object",
											"name": "Decals",
											"x": -0.6033333333333332,
											"y": 1.2766666666666666,
											"children": [
												{
													"type": "tdecal",
													"name": "tdecal",
													"x": 0.33,
													"y": -1.08,
													"scaleX": 12.93,
													"scaleY": 12.93,
													"scaleZ": 0.44,
													"rotationZ": 93.5,
													"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
													"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"editorOnly": true,
									"locked": true,
									"x": -0.024,
									"y": 0.35499400000000003,
									"z": -0.7779219999999999,
									"scaleX": 4000,
									"scaleY": 4000,
									"scaleZ": 2,
									"color": -14869219,
									"kind": 0,
									"args": [
										0
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "PillageRaid",
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "object",
							"name": "target",
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"children": [
								{
									"type": "advancedDecal",
									"name": "targetOK",
									"scaleX": 90,
									"scaleY": 90,
									"scaleZ": 45,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.5,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target2-2-thick01.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4166666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4166666666666667
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00914089075238272,
														"dt": -0.5009074885978119
													},
													"nextHandle": {
														"dv": -0.008333333333333304,
														"dt": 0.44962891024828444
													}
												},
												{
													"time": 0.99,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.4166666666666666
													}
												},
												{
													"time": 1.9949999999999999,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.33499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33499999999999996
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_circle",
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 30.91,
									"rotationZ": 149.15722792445632,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.5,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target1_thick.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "uOffset",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0.5,
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
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 12,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationZ": 167.9638026188483,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 4,
									"rotationX": 90,
									"rotationY": 180,
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
													"mode": "Overlay",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"emissive": 1.5,
													"alphaKill": true
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Logo_PillageRaid_05.png",
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
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33333333333333326
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33333333333333326
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33333333333333326
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Village",
							"editorOnly": true,
							"z": 0.6,
							"children": [
								{
									"type": "object",
									"name": "group",
									"x": 0.096,
									"y": 0.393174,
									"z": -0.8080719999999999,
									"rotationZ": 6.599999999999998,
									"children": [
										{
											"type": "model",
											"name": "Village_Large_01",
											"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
											"x": -0.1421921619706209,
											"y": -0.1848820950609353,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 1.25,
											"rotationZ": 102.20000000000003,
											"children": [
												{
													"type": "shader",
													"name": "WindCloth",
													"source": "shaders/WindCloth.hx",
													"enabled": false,
													"props": {
														"speed": 2,
														"amount": 3.64,
														"zamount": 1,
														"freq": 9.09
													},
													"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
													"recursiveApply": false,
													"isInstance": true
												}
											]
										},
										{
											"type": "object",
											"name": "Decals",
											"x": -0.6033333333333332,
											"y": 1.2766666666666666,
											"children": [
												{
													"type": "tdecal",
													"name": "tdecal",
													"x": 0.33,
													"y": -1.08,
													"scaleX": 12.93,
													"scaleY": 12.93,
													"scaleZ": 0.44,
													"rotationZ": 93.5,
													"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
													"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"editorOnly": true,
									"locked": true,
									"x": -0.024,
									"y": 0.35499400000000003,
									"z": -0.7779219999999999,
									"scaleX": 4000,
									"scaleY": 4000,
									"scaleZ": 2,
									"color": -14869219,
									"kind": 0,
									"args": [
										0
									]
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "subFX",
			"name": "Ability_ProbeSetup",
			"source": "Fx/Abilities/Ability_ProbeSetup.fx",
			"enabled": false,
			"y": -54.25104
		}
	]
}