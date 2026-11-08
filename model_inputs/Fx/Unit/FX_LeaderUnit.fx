{
	"type": "fx",
	"cullingRadius": 3,
	"blendFactor": 1,
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
			"enabled": false,
			"y": 0.5,
			"rotationZ": 180,
			"children": [
				{
					"type": "object",
					"name": "Leader",
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Fremen/Unit/Otheym/Male01_FremenOtheym.fbx",
							"scaleX": 2.8000000000000007,
							"scaleY": 2.8000000000000007,
							"scaleZ": 2.8000000000000007,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_Run.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "Bazooka",
							"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
							"rotationX": -98.5,
							"rotationY": -0.7,
							"rotationZ": 2
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Leader.Bazooka",
							"target": "FXAnimation.FXRoot.Leader.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "object",
					"name": "LeaderFX",
					"y": 0.2,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "object",
							"name": "CirclesFloor",
							"z": -0.0075000000000000015,
							"children": [
								{
									"type": "object",
									"name": "Floor",
									"children": [
										{
											"type": "object",
											"name": "decals"
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"x": -2.449293598294706e-17,
									"y": 0.3,
									"z": -0.008167333333333337,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"children": [
										{
											"type": "polygon",
											"name": "BigCircle",
											"x": -6.162975822039155e-33,
											"y": -1.3877787807814457e-17,
											"z": 0.15133066666666667,
											"scaleX": 4.799999999999999,
											"scaleY": 4.799999999999999,
											"scaleZ": 28.000000000000004,
											"rotationZ": -65.06315497740563,
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
															"culling": "Back",
															"colorMask": 255,
															"depthTest": "LessEqual",
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
														"alpha": 3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_02.png"
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
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
														"envBlend": 0.9,
														"envColorSet": false
													},
													"isInstance": true
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
															"time": 6,
															"value": -1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "Circle",
											"x": -6.162975822039155e-33,
											"y": -1.3877787807814457e-17,
											"z": 0.15133066666666667,
											"scaleX": 4.000000000000001,
											"scaleY": 4.000000000000001,
											"scaleZ": 28.000000000000004,
											"rotationZ": 65.06315497740559,
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
															"culling": "Back",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"drawOrder": "100",
															"emissive": 1
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/FloorScan_Round_08.png"
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
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
														"envBlend": 0.9,
														"envColorSet": false
													},
													"isInstance": true
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
															"time": 3,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"enabled": false,
											"x": -6.162975822039155e-33,
											"y": -1.3877787807814457e-17,
											"z": -0.30266133333333334,
											"scaleX": 14.400000000000002,
											"scaleY": 14.400000000000002,
											"scaleZ": 1.2000000000000002,
											"rotationZ": 180,
											"albedoMap": "Fx/Alphas/T_circle2.png",
											"fadePower": 1.8,
											"fadeStart": 0.08,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.3
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
															0.6745098039215687,
															0.3333333333333333
														]
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
				}
			]
		}
	]
}