{
	"type": "fx",
	"duration": 5,
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
			"scaleX": 1.8,
			"scaleY": 1.8,
			"scaleZ": 1.8,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_FightIdle.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.Chara.GunIlesa",
							"target": ".FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.Chara.GunIlesa1",
							"target": ".FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
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
					"name": "CharaGROW",
					"enabled": false,
					"x": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_Skill.fbx"
								},
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.CharaGROW.GunIlesa",
							"target": "FXAnimation.FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.CharaGROW.GunIlesa1",
							"target": "FXAnimation.FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.9921568627450981,
									0.30980392156862746,
									0.5686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 5.886,
											"mode": 2
										},
										{
											"time": 0.719905294727989,
											"value": 5.885972442932601,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.9775280898876405,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 0.8833333333333333,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.6509803921568628
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0.40479269356467923,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6616199124010438,
									"value": 1.3,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.42343974799374484,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4970519417498684,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.8117273550636853,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.2161644337069517
											},
											"nextHandle": {
												"dv": 0.038292905226513727,
												"dt": 0.1241634625992507
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.3201398914657678,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.33013989146576783,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9025932630583072,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9125932630583072,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "CharaGROW",
					"x": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_Skill.fbx"
								},
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.CharaGROW.GunIlesa",
							"target": ".FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.CharaGROW.GunIlesa1",
							"target": ".FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.9921568627450981,
									0.30980392156862746,
									0.5686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 5.886,
											"mode": 2
										},
										{
											"time": 0.719905294727989,
											"value": 5.885972442932601,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.9775280898876405,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 0.8833333333333333,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.6509803921568628
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0.40479269356467923,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6616199124010438,
									"value": 1.3,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.42343974799374484,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4970519417498684,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.8117273550636853,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.2161644337069517
											},
											"nextHandle": {
												"dv": 0.038292905226513727,
												"dt": 0.1241634625992507
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
											"time": 0.3775559537922272,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4970519417498684,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.8117273550636853,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.2161644337069517
											},
											"nextHandle": {
												"dv": 0.038292905226513727,
												"dt": 0.1241634625992507
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.3201398914657678,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.33013989146576783,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9025932630583072,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9125932630583072,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"x": 0.6965427272727274,
					"y": 0.040847272727272725,
					"z": 0.5864790909090908,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "object",
							"name": "Impact",
							"z": -0.48962,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": -0.27604,
									"z": 0.74105,
									"scaleX": 2.5,
									"scaleY": 2.75,
									"scaleZ": 2.75,
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
													"colorMask": 255,
													"emissive": 0.5
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
												"texture": "Fx/Alphas/T_ChocWave_06.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4067639899786295,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.48663976637614503,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
															"time": 0.43243504646560194,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.29111814826726923,
																"dt": 0.06915880636768901
															}
														},
														{
															"time": 0.9561813730391129,
															"value": 1,
															"prevHandle": {
																"dv": -0.003619090616702847,
																"dt": -0.5207616528940111
															},
															"nextHandle": {
																"dv": 0.003619090616702847,
																"dt": 0.5207616528940111
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.4168563593404633,
													"value": 0,
													"prevHandle": {
														"dv": -2.6247774787715947,
														"dt": -0.15127039956314536
													},
													"nextHandle": {
														"dv": 1.0991423714056185,
														"dt": 0.06274006684579092
													}
												},
												{
													"time": 0.9306416355406628,
													"value": 1,
													"prevHandle": {
														"dv": 0.0683347894794597,
														"dt": -0.4378116347358676
													},
													"nextHandle": {
														"dv": -0.05190948879585082,
														"dt": 0.3333275426476711
													}
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
													0.9529411764705882,
													0.32156862745098036,
													0.615686274509804
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Flare",
									"x": -0.15167,
									"z": 0.83551,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													40,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.35,
												"emitType": "Burst",
												"instScale": 0.2,
												"randomGradient": {
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
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"emissive": 6,
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
																"texture": "Fx/Alphas/T_Flare06_512.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
																			"value": 1,
																			"mode": 2
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
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
							"name": "FlashDecals",
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
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
															"time": 0.2940577776145902,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3040577776145902,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.406214969437134,
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
									"name": "advancedDecal_Pink",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4729777901654451,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5157328446436774,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1579623412428142,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.31988251172550664
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9372549019607843,
													0.21568627450980393,
													0.5529411764705883
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3741067266845328,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4192728056048347,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6809098447043005,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
													1,
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
							"type": "object",
							"name": "Passive",
							"enabled": false,
							"editorOnly": true,
							"x": -1.1102230246251565e-16,
							"y": 6.938893903907228e-18,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.05628,
									"y": 0.00233,
									"z": -0.02737,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
											"name": "PinkFlames",
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
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9243667237982353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2254056951501509,
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
													"time": 1.1314451182330614,
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
													"time": 1.395365018925911,
													"value": 1,
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 1.025095045294135,
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
													"time": 1.2890149459869846,
													"value": 1,
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.27188579200767293,
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
													"time": 0.5358056927005226,
													"value": 1,
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
									"x": -0.15476,
									"y": -0.0815,
									"z": -0.00382,
									"scaleX": 2.76,
									"scaleY": 2.76,
									"scaleZ": 1.5,
									"rotationX": 100,
									"rotationY": 14.5,
									"rotationZ": 12.5,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 1,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.129072144898939,
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
															"time": 1.3929920455917888,
															"value": 1,
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9529411764705882,
													0.32156862745098036,
													0.615686274509804
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Skill.Passive",
							"target": "FXAnimation.FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
						},
						{
							"type": "object",
							"name": "Flash_in",
							"x": -0.26952,
							"z": 0.24171,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.2,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon-flareish_GOLD",
											"scaleX": 12,
											"scaleY": 12,
											"scaleZ": 12,
											"rotationY": -90,
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
														"texture": "Fx/Alphas/T_SandDecal_04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/circGrad3.jpg",
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
															"keys": [
																{
																	"time": 0.4039630447939433,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.0034311001824057,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.022038754522800685,
																		"dt": -0.5572482360285976
																	},
																	"nextHandle": {
																		"dv": -0.022038754522800685,
																		"dt": 0.5572482360285976
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
													"keys": [
														{
															"time": 0.38838435766880464,
															"value": 0,
															"prevHandle": {
																"dv": -1.9310971472661906,
																"dt": -0.17120587028031628
															},
															"nextHandle": {
																"dv": 0.794995631561622,
																"dt": 0.07238914098793658
															}
														},
														{
															"time": 0.9021696338690042,
															"value": 1,
															"prevHandle": {
																"dv": 0.0683347894794597,
																"dt": -0.4378116347358676
															},
															"nextHandle": {
																"dv": -0.05190948879585082,
																"dt": 0.3333275426476711
															}
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
															0.6980392156862745,
															0.34901960784313724
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon-flareish_PINK",
											"scaleX": 13,
											"scaleY": 13,
											"scaleZ": 13,
											"rotationX": -90,
											"rotationY": -27.8,
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
															"colorMask": 255,
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
														"texture": "Fx/Alphas/T_SandDecal_04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/circGrad3.jpg",
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
															"keys": [
																{
																	"time": 0.4039630447939433,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.0034311001824057,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.022038754522800685,
																		"dt": -0.5572482360285976
																	},
																	"nextHandle": {
																		"dv": -0.022038754522800685,
																		"dt": 0.5572482360285976
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
													"keys": [
														{
															"time": 0.38838435766880464,
															"value": 0,
															"prevHandle": {
																"dv": -1.9310971472661906,
																"dt": -0.17120587028031628
															},
															"nextHandle": {
																"dv": 0.794995631561622,
																"dt": 0.07238914098793658
															}
														},
														{
															"time": 0.9021696338690042,
															"value": 1,
															"prevHandle": {
																"dv": 0.0683347894794597,
																"dt": -0.4378116347358676
															},
															"nextHandle": {
																"dv": -0.05190948879585082,
																"dt": 0.3333275426476711
															}
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
															0.34901960784313724,
															0.48627450980392156
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
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
							"name": "FlareVertical",
							"x": -0.35424,
							"z": 0.22837,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_FlareLarge",
									"rotationZ": 54.22958384688976,
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
											"scaleX": 6,
											"scaleY": 40,
											"scaleZ": 2.05,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0,
															"emissive": 0.5,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.36104268226062847,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.49405840730401784,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.0754874349927541,
																	"value": 0,
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
																	"time": 0.421627252173924,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.4948153789663787,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.601757282094343e-17,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.15506446919274985
																	}
																},
																{
																	"time": 1.0754874349927541,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.65,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																		"color": -117460391
																	},
																	{
																		"position": 0.9765625,
																		"color": -117446193
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
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
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "BACKUP",
			"enabled": false,
			"scaleX": 2.75,
			"scaleY": 2.75,
			"scaleZ": 2.75,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_Skill.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.GunIlesa",
							"target": "FXAnimation.FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.GunIlesa1",
							"target": "FXAnimation.FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
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
					"name": "CharaGROW",
					"x": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_Skill.fbx"
								},
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
											"emissive": 1
										}
									}
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"enabled": false,
									"props": {
										"useNormalMap": false,
										"onDecal": false,
										"scale": 1,
										"rotation": 0
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9,
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
											"emissive": 1
										}
									}
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.CharaGROW.GunIlesa",
							"target": "FXAnimation.FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.CharaGROW.GunIlesa1",
							"target": "FXAnimation.FXRoot.CharaGROW.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.9921568627450981,
									0.30980392156862746,
									0.5686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 5.886,
											"mode": 2
										},
										{
											"time": 0.719905294727989,
											"value": 5.885972442932601,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.9775280898876405,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.4048139230296129,
											"value": 0.8833333333333333,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.0856
											}
										},
										{
											"time": 0.719905294727989,
											"value": 0.6509803921568628
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0.40479269356467923,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6616199124010438,
									"value": 1.3,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keys": [
										{
											"time": 0.42343974799374484,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4391786289119658,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.7002977106910189,
											"value": 0,
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
											"time": 0.42343974799374484,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4970519417498684,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.8117273550636853,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.2161644337069517
											},
											"nextHandle": {
												"dv": 0.038292905226513727,
												"dt": 0.1241634625992507
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.3201398914657678,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.33013989146576783,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9025932630583072,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9125932630583072,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"x": 0.6965427272727274,
					"y": 0.040847272727272725,
					"z": 0.5864790909090908,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "object",
							"name": "Impact",
							"z": -0.48962,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": -0.27604,
									"z": 0.74105,
									"scaleX": 2.5,
									"scaleY": 2.75,
									"scaleZ": 2.75,
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
													"colorMask": 255,
													"emissive": 0.5
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
												"texture": "Fx/Alphas/T_ChocWave_06.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4067639899786295,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.48663976637614503,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Dissolve_ChockWave.png",
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
															"time": 0.43243504646560194,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.29111814826726923,
																"dt": 0.06915880636768901
															}
														},
														{
															"time": 0.9561813730391129,
															"value": 1,
															"prevHandle": {
																"dv": -0.003619090616702847,
																"dt": -0.5207616528940111
															},
															"nextHandle": {
																"dv": 0.003619090616702847,
																"dt": 0.5207616528940111
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap_Gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.4168563593404633,
													"value": 0,
													"prevHandle": {
														"dv": -2.6247774787715947,
														"dt": -0.15127039956314536
													},
													"nextHandle": {
														"dv": 1.0991423714056185,
														"dt": 0.06274006684579092
													}
												},
												{
													"time": 0.9306416355406628,
													"value": 1,
													"prevHandle": {
														"dv": 0.0683347894794597,
														"dt": -0.4378116347358676
													},
													"nextHandle": {
														"dv": -0.05190948879585082,
														"dt": 0.3333275426476711
													}
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
													0.9529411764705882,
													0.32156862745098036,
													0.615686274509804
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Flare",
									"x": -0.15167,
									"z": 0.83551,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													40,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.35,
												"emitType": "Burst",
												"instScale": 0.2,
												"randomGradient": {
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
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"colorMask": 255,
																	"depthTest": "LessEqual",
																	"emissive": 6,
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
																"texture": "Fx/Alphas/T_Flare06_512.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
																			"value": 1,
																			"mode": 2
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
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
							"name": "FlashDecals",
							"rotationZ": 90,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
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
															"time": 0.2940577776145902,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3040577776145902,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.406214969437134,
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
									"name": "advancedDecal_Pink",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4729777901654451,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5157328446436774,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1579623412428142,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.31988251172550664
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9372549019607843,
													0.21568627450980393,
													0.5529411764705883
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"y": 0.24715,
									"z": 0.20612,
									"scaleZ": 0.5,
									"rotationY": 89.99999999999999,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.3741067266845328,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4192728056048347,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6809098447043005,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.050000000000000044,
																"dt": -0.19927400323396371
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
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
													1,
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
							"type": "object",
							"name": "Passive",
							"enabled": false,
							"editorOnly": true,
							"x": -1.1102230246251565e-16,
							"y": 6.938893903907228e-18,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.05628,
									"y": 0.00233,
									"z": -0.02737,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
											"name": "PinkFlames",
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
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9243667237982353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.2254056951501509,
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
													"time": 1.1314451182330614,
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
													"time": 1.395365018925911,
													"value": 1,
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 1.025095045294135,
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
													"time": 1.2890149459869846,
													"value": 1,
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.27188579200767293,
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
													"time": 0.5358056927005226,
													"value": 1,
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
									"x": -0.15476,
									"y": -0.0815,
									"z": -0.00382,
									"scaleX": 2.76,
									"scaleY": 2.76,
									"scaleZ": 1.5,
									"rotationX": 100,
									"rotationY": 14.5,
									"rotationZ": 12.5,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 1,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.6
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.129072144898939,
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
															"time": 1.3929920455917888,
															"value": 1,
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9529411764705882,
													0.32156862745098036,
													0.615686274509804
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Skill.Passive",
							"target": "FXAnimation.FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
						},
						{
							"type": "object",
							"name": "Flash_in",
							"x": -0.26952,
							"z": 0.24171,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.2,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon-flareish_GOLD",
											"scaleX": 12,
											"scaleY": 12,
											"scaleZ": 12,
											"rotationY": -90,
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
														"texture": "Fx/Alphas/T_SandDecal_04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/circGrad3.jpg",
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
															"keys": [
																{
																	"time": 0.4039630447939433,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.0034311001824057,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.022038754522800685,
																		"dt": -0.5572482360285976
																	},
																	"nextHandle": {
																		"dv": -0.022038754522800685,
																		"dt": 0.5572482360285976
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
													"keys": [
														{
															"time": 0.38838435766880464,
															"value": 0,
															"prevHandle": {
																"dv": -1.9310971472661906,
																"dt": -0.17120587028031628
															},
															"nextHandle": {
																"dv": 0.794995631561622,
																"dt": 0.07238914098793658
															}
														},
														{
															"time": 0.9021696338690042,
															"value": 1,
															"prevHandle": {
																"dv": 0.0683347894794597,
																"dt": -0.4378116347358676
															},
															"nextHandle": {
																"dv": -0.05190948879585082,
																"dt": 0.3333275426476711
															}
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
															0.6980392156862745,
															0.34901960784313724
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon-flareish_PINK",
											"scaleX": 13,
											"scaleY": 13,
											"scaleZ": 13,
											"rotationX": -90,
											"rotationY": -27.8,
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
															"colorMask": 255,
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
														"texture": "Fx/Alphas/T_SandDecal_04.png"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/circGrad3.jpg",
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
															"keys": [
																{
																	"time": 0.4039630447939433,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.0034311001824057,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.022038754522800685,
																		"dt": -0.5572482360285976
																	},
																	"nextHandle": {
																		"dv": -0.022038754522800685,
																		"dt": 0.5572482360285976
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
													"keys": [
														{
															"time": 0.38838435766880464,
															"value": 0,
															"prevHandle": {
																"dv": -1.9310971472661906,
																"dt": -0.17120587028031628
															},
															"nextHandle": {
																"dv": 0.794995631561622,
																"dt": 0.07238914098793658
															}
														},
														{
															"time": 0.9021696338690042,
															"value": 1,
															"prevHandle": {
																"dv": 0.0683347894794597,
																"dt": -0.4378116347358676
															},
															"nextHandle": {
																"dv": -0.05190948879585082,
																"dt": 0.3333275426476711
															}
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
															0.34901960784313724,
															0.48627450980392156
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
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
							"name": "FlareVertical",
							"x": -0.35424,
							"z": 0.22837,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_FlareLarge",
									"rotationZ": 54.22958384688976,
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
											"scaleX": 6,
											"scaleY": 40,
											"scaleZ": 2.05,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0,
															"emissive": 0.5,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.36104268226062847,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.49405840730401784,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.0754874349927541,
																	"value": 0,
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
																	"time": 0.421627252173924,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.4948153789663787,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.601757282094343e-17,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.15506446919274985
																	}
																},
																{
																	"time": 1.0754874349927541,
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.65,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
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
																		"color": -117460391
																	},
																	{
																		"position": 0.9765625,
																		"color": -117446193
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
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
								}
							]
						}
					]
				}
			]
		}
	]
}