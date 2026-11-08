{
	"type": "fx",
	"duration": 1,
	"cullingRadius": 15,
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
					"name": "Chara",
					"editorOnly": true,
					"y": -9.184572294626296e-18,
					"scaleX": 0.91,
					"scaleY": 0.91,
					"scaleZ": 0.91,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"y": 1.5407439555097887e-33,
							"scaleX": 2.55,
							"scaleY": 2.55,
							"scaleZ": 2.55,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_AttackRange02.fbx"
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
							"y": 0.02477,
							"z": -0.04613,
							"rotationX": -103.64
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
							"target": "FXAnimation.FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
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
					"name": "shot01",
					"x": 2.98404,
					"y": -0.3089,
					"z": 4.79759,
					"scaleX": 1.0989010989010988,
					"scaleY": 1.0989010989010988,
					"scaleZ": 1.0989010989010988,
					"children": [
						{
							"type": "object",
							"name": "Trail",
							"x": 1.27404,
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											2.5,
											80,
											2
										],
										"lifeTime": 0.17,
										"instStretch_rand": [
											0.5,
											30,
											0.4
										],
										"emitType": "Burst",
										"speedFactor": 1.5,
										"warmUpTime": -0.195,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.8431372549019608,
											0.8431372549019608,
											0.8431372549019608,
											0.5686274509803921
										]
									},
									"x": -0.76268,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"scaleX": 0.06,
											"scaleY": 0.08,
											"scaleZ": 0.06,
											"rotationX": 90,
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
															"depthTest": "Less"
														}
													},
													"wrapRepeat": true,
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
														"alpha": 5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square03.jpg",
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
																	"mode": 2
																},
																{
																	"time": 0.16548608368509074,
																	"value": 0.3,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08521303258145363
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08521303258145363
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
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.39,
														"uvScaleY": 0.14,
														"texture": "Fx/noise/T_Embers03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.2
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
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.10892473051017389,
																		"dt": -0.5001129771514767
																	},
																	"nextHandle": {
																		"dv": 0.10823437312607831,
																		"dt": 0.5012403477192369
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.02703263880560347,
																		"dt": -0.11612364243943196
																	},
																	"nextHandle": {
																		"dv": -0.07703516026634512,
																		"dt": 0.33329932493317016
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
														"range": 1.2,
														"power": 1.2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													1,
													0.2901960784313725,
													0.5607843137254902
												],
												"pointA": 1,
												"colorB": [
													1,
													0.2901960784313725,
													0.5607843137254902
												],
												"pointB": 0
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.7725490196078432,
													0.8941176470588235
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.17620625775559506,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.33427363603634946,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02983786097744015
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.02983786097744015
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5908262503312967,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "projectileVerticalAnticipation",
									"enabled": false,
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											2.3,
											60,
											2
										],
										"lifeTime": 0.35,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitType": "Burst",
										"speedFactor": 1.5,
										"warmUpTime": -0.1,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.8431372549019608,
											0.8431372549019608,
											0.8431372549019608,
											0.5686274509803921
										]
									},
									"x": -2.78023,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.1,
											"rotationX": 90,
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
															"depthTest": "Less"
														}
													},
													"wrapRepeat": true,
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
														"texture": "Fx/Gradients/T_Square03.jpg",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.39,
														"uvScaleY": 0.14,
														"texture": "Fx/noise/T_Embers03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.2
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
																	"value": 0.023954922435488357,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -2.2985063026124952,
																		"dt": -0.39680318064595804
																	},
																	"nextHandle": {
																		"dv": 0.2903464877677715,
																		"dt": 0.05012403477192369
																	}
																},
																{
																	"time": 0.2689989866093238,
																	"value": 0.5415290962823853,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.010144170718511343,
																		"dt": -0.09801113908041668
																	},
																	"nextHandle": {
																		"dv": 0.025247520675458324,
																		"dt": 0.2439369692233619
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.02703263880560347,
																		"dt": -0.11612364243943196
																	},
																	"nextHandle": {
																		"dv": -0.07703516026634512,
																		"dt": 0.33329932493317016
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
														"range": 1.2,
														"power": 1.2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.23137254901960785,
													0.01568627450980392,
													0.09803921568627451
												],
												"pointA": 1,
												"colorB": [
													0.16470588235294117,
													0,
													0.06274509803921569
												],
												"pointB": 0.36
											}
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.4666666666666666,
													"mode": 2
												},
												{
													"time": 0.20384049176819544,
													"value": 0.9644444444444444,
													"mode": 0,
													"prevHandle": {
														"dv": 1.3106367812950763e-16,
														"dt": -0.05597326649958229
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.7801836322789675
													}
												},
												{
													"time": 1,
													"value": -0.0311111111111112,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "lastingParticlesLaser",
									"enabled": false,
									"props": {
										"lifeTime": 0.3,
										"lifeTimeRand": 0.3,
										"warmUpTime": -0.2,
										"alignMode": "Speed",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitShape": "Box",
										"emitOrientation": "Speed",
										"instStartSpeed": [
											8,
											0,
											0
										],
										"instStartSpeed_rand": [
											2,
											0,
											0
										],
										"instDampen": 3.33,
										"useRandomColor": true,
										"useRandomGradient": true,
										"randomColor1": [
											0.5764705882352941,
											0.5764705882352941,
											0.5764705882352941,
											1
										],
										"instStretch": [
											6,
											0.4,
											0.5
										],
										"instStretch_rand": [
											3,
											0.1,
											0
										],
										"instScale": 0.67,
										"instScale_rand": 0.27
									},
									"x": 3.30115,
									"scaleX": 5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
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
															"emissive": 0.45,
															"depthTest": "Less"
														}
													},
													"diffuseMap": "Fx/Gradients/alphaCircular.png"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 0.92,
														"uvScaleX": 0.5,
														"uvScaleY": 0.84,
														"texture": "Fx/noise/perlin06.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.2,
															0.1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03333333333333344,
																		"dt": -0.1428571428571429
																	},
																	"nextHandle": {
																		"dv": -0.062219828461388765,
																		"dt": 0.26665640769166266
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															1,
															0.44313725490196076,
															0.6549019607843137
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.25098039215686274,
															0.4235294117647059
														],
														"pointB": 0
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "lastingParticles",
									"enabled": false,
									"props": {
										"lifeTime": 0.6,
										"lifeTimeRand": 0.2,
										"warmUpTime": -0.17,
										"alignMode": "Speed",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstParticleCount": 4,
										"emitShape": "Box",
										"emitOrientation": "Speed",
										"instStartSpeed_rand": [
											2,
											0,
											0
										],
										"instDampen": 3.71,
										"useRandomColor": true,
										"randomColor1": [
											0.5764705882352941,
											0.5764705882352941,
											0.5764705882352941,
											1
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale": 0.36,
										"instScale_rand": 0.23,
										"instStartSpeed": [
											5,
											0,
											0
										],
										"instOrbitSpeed_rand": [
											0.1,
											0.1,
											0.1
										],
										"instAcceleration": [
											0,
											0,
											5
										],
										"instAcceleration_rand": [
											5,
											5,
											1
										]
									},
									"x": 3.53444,
									"scaleX": 10,
									"scaleY": 0.6,
									"scaleZ": 0.6,
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
															"blend": "Add",
															"shadows": false,
															"culling": "Back",
															"colorMask": 255,
															"emissive": 3.41,
															"depthTest": "Less"
														}
													},
													"diffuseMap": "Fx/Gradients/alphaCircular.png"
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															1,
															0.7058823529411764,
															0.39215686274509803
														],
														"pointA": 1,
														"colorB": [
															1,
															0.6470588235294118,
															0.30196078431372547
														],
														"pointB": 0.29
													}
												},
												{
													"type": "shader",
													"name": "ParticleFade",
													"source": "hrt.shader.ParticleFade",
													"props": {
														"fadeInLife": 0.1,
														"fadeOutLife": 1,
														"power": 1
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
							"name": "Muzzle",
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "Shot1",
									"children": [
										{
											"type": "emitter",
											"name": "SmokeGun",
											"enabled": false,
											"props": {
												"instScale_rand": 0.29,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													1,
													0.6901960784313725,
													0.3254901960784314,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"lifeTimeRand": 0.5,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 4,
												"emitAngle": 1,
												"alignMode": "Screen",
												"lifeTime": 2.5,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													1,
													0.7843137254901961,
													0.5254901960784314,
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
												"speedFactor": 3.7,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"useRandomColor": true,
												"warmUpTime": -0.37
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"emissive": 8
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_ChocWave_Blurred.png",
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
																"width": 0.75,
																"uvScaleX": 0.25,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/clouds.png",
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
																				"dt": -0.62
																			},
																			"nextHandle": {
																				"dv": -2.1771608536988747e-16,
																				"dt": 0.3333350157390327
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
															"time": 0,
															"value": 0.28277436002838635,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.685
															},
															"nextHandle": {
																"dv": -1.582726646250665e-16,
																"dt": 0.2500018203703057
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
											"name": "FlashFlare",
											"enabled": false,
											"props": {
												"instScale_rand": 0.29,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													1,
													0.6901960784313725,
													0.3254901960784314,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"lifeTimeRand": 0.5,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 4,
												"emitAngle": 1,
												"alignMode": "Screen",
												"lifeTime": 2.5,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													1,
													0.7843137254901961,
													0.5254901960784314,
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
												"speedFactor": 3.7,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"useRandomColor": true,
												"warmUpTime": -0.37
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"emissive": 2.12
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
																"texture": "Fx/Alphas/T_LensFlare_05.png",
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
																"saturation": 0,
																"width": 1,
																"uvScaleX": 0.25,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/perlin06.png",
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
																				"dt": -0.62
																			},
																			"nextHandle": {
																				"dv": -2.1771608536988747e-16,
																				"dt": 0.3333350157390327
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
															"time": 0,
															"value": 0.28277436002838635,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.685
															},
															"nextHandle": {
																"dv": -1.582726646250665e-16,
																"dt": 0.2500018203703057
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
											"name": "Distortion",
											"enabled": false,
											"props": {
												"instScale_rand": 0,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													1,
													0.6901960784313725,
													0.3254901960784314,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"lifeTimeRand": 0.2,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 8,
												"emitAngle": 1,
												"alignMode": "Screen",
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													1,
													0.7843137254901961,
													0.5254901960784314,
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
												"speedFactor": 3.7,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"useRandomColor": true,
												"warmUpTime": -0.37
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"mode": "Distortion",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "Back",
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true,
																	"depthWrite": "On"
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
																"texture": "Fx/Alphas/T_ChocWave_Contrast.png",
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
															"name": "DistortionMap",
															"source": "shaders/DistortionMap.hx",
															"props": {
																"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
																"intensity": 0.015
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
																			"value": 1.4240365376995874,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.1438836500205134,
																				"dt": -0.4763721338556696
																			},
																			"nextHandle": {
																				"dv": -0.2551111111111112,
																				"dt": 0.10551280456700678
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.004242424242424214,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.03333333333333333,
																				"dt": -0.51
																			},
																			"nextHandle": {
																				"dv": -0.02178544542538359,
																				"dt": 0.33331731500836026
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
															"time": 0,
															"value": 0.28277436002838635,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 0.9988431099235052,
															"value": 1.596443960877134,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03443808703089468,
																"dt": -0.3759760765082202
															},
															"nextHandle": {
																"dv": -0.022899160758119194,
																"dt": 0.25000043148287765
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
											"name": "FlareStar2",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.15,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 3,
												"emitType": "Burst",
												"instScale_rand": 0.5,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													0
												],
												"warmUpTime": -0.1,
												"lifeTimeRand": 0.02,
												"useRandomColor": true,
												"randomColor1": [
													0.8549019607843137,
													0.8549019607843137,
													0.8549019607843137,
													1
												],
												"instRotation": [
													0,
													0,
													180
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationY": 90,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare05.png",
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
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.2610256091340131,
																			"value": 3,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.0864952927985753
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.011804602326868493
																			}
																		},
																		{
																			"time": 0.2948996853763314,
																			"value": 0.7544444444444445,
																			"mode": 0
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
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
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.11764705882352941,
																	0,
																	0.06274509803921569
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.51,
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
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.265,
															"value": 1.4883021831512457,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08666666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05000000000000001
															}
														},
														{
															"time": 0.41000000000000003,
															"value": 0.7166666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": 0.04420191197517367,
																"dt": 0.37129606059146064
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															1,
															0.2901960784313725,
															0.5607843137254902
														],
														"pointA": 0.37,
														"colorB": [
															1,
															0.2,
															0.5019607843137255
														],
														"pointB": 0
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
							"name": "Back_Sand",
							"props": {
								"instScale_rand": 1.5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									0.9803921568627451,
									0.9254901960784314,
									0.8980392156862745,
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
								"instScale": 1.89,
								"emitAngle": 10,
								"alignMode": "Screen",
								"lifeTime": 6,
								"emitRad1": 0.64,
								"emitRad2": 0.89,
								"randomColor2": [
									0.7490196078431373,
									0.6705882352941176,
									0.6313725490196078,
									1
								],
								"instSpeed_rand": [
									3,
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
								"maxCount": 3,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
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
								],
								"burstParticleCount": 3
							},
							"x": -3.8253,
							"y": 0.46661,
							"z": -3.11787,
							"scaleX": 0.5,
							"scaleY": 2,
							"scaleZ": 0.1,
							"rotationZ": 180,
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
												"scale": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
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
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0,
												"sandColorSet": false,
												"envBlend": 0.36,
												"envColorSet": true
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
												"dv": 2.9295995491315057,
												"dt": -0.31584745139074033
											},
											"nextHandle": {
												"dv": -1.0666666666666667,
												"dt": 0.115
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4399999999999999
											},
											"nextHandle": {
												"dv": -4.921775664347038e-16,
												"dt": 0.6028402231288772
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