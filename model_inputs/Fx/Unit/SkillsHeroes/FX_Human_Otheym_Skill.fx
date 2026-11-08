{
	"type": "fx",
	"duration": 3,
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
			"scaleX": 0.72,
			"scaleY": 0.72,
			"scaleZ": 0.72,
			"children": [
				{
					"type": "object",
					"name": "Otheym",
					"editorOnly": true,
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
									"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_Skill.fbx"
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
							"object": ".FXRoot.Otheym.Bazooka",
							"target": ".FXRoot.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						},
						{
							"type": "model",
							"name": "Female01_Infiltrator",
							"source": "Character/Fremen/Unit/Infiltrator/Female01_Infiltrator.fbx",
							"x": 5.62302,
							"y": 9.63626,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/DualSwords/Anim_Female01_DualSwords_FightIdle.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "Female01_Infiltrator01",
							"source": "Character/Fremen/Unit/Infiltrator/Female01_Infiltrator.fbx",
							"x": 7.92205,
							"y": 12.90288,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/DualSwords/Anim_Female01_DualSwords_FightIdle.fbx",
									"loop": true
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
					"type": "object",
					"name": "Skill",
					"children": [
						{
							"type": "object",
							"name": "flare2",
							"x": 1.93937,
							"y": -0.62528,
							"z": 5.94762,
							"scaleX": 0.9799999999999996,
							"scaleY": 0.9799999999999995,
							"scaleZ": 0.9799999999999998,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											18,
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
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"instScale": 1.65,
										"simulationSpace": "World",
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
																	"time": 0.006831217655519195,
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
																	"time": 0.18783894350739566,
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
													"time": 0.006831217655519195,
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
													"time": 1.0068312176555192,
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
													"time": 0.006831217655519195,
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
													"time": 1.0068312176555192,
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
									"type": "lookAt",
									"name": "lookAt",
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon-flareish",
											"y": 1.1102230246251565e-16,
											"scaleX": 9.536312624264596,
											"scaleY": 9.536312624264596,
											"scaleZ": 9.536312624264594,
											"rotationX": -9.699005189473816e-18,
											"rotationY": -89.99999999999999,
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
																	"time": 0.7265578049970838,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.3260258603855462,
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
															"time": 0.7109791178719451,
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
															"time": 1.2247643940721447,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0.2,
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
											0
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"lifeTime": 0.6,
										"emitType": "Burst",
										"burstDelay": 0.1,
										"instScale": 15,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": -0.7,
										"animationLoop": false,
										"alignMode": "Screen",
										"instStretch": [
											1,
											1,
											0.01
										],
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
									"x": 0.04049999999999998,
									"y": -0.07709183673469389,
									"z": -0.30964285714285733,
									"scaleX": 0.10204081632653067,
									"scaleY": 0.10204081632653067,
									"scaleZ": 0.10204081632653064,
									"children": [
										{
											"type": "model",
											"name": "Ring",
											"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
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
															"culling": "None"
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
														"intensity": 0.01
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
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 0.75,
														"scaleY": 0.75,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 3,
														"power": 1
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
													"time": 0.009999999999999995,
													"value": -0.02419093677588713,
													"prevHandle": {
														"dv": -0.6101554739171128,
														"dt": -0.33018814592265844
													},
													"nextHandle": {
														"dv": 0.9136438538946278,
														"dt": 0.49018439845683004
													}
												},
												{
													"time": 1,
													"value": 1.29108698853561,
													"prevHandle": {
														"dv": -0.11323294039229448,
														"dt": -0.39715416696622907
													},
													"nextHandle": {
														"dv": 0.09487993739524597,
														"dt": 0.33286343471616847
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Knee",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -3.36497,
							"y": -1.30254,
							"z": 0.57497,
							"scaleX": 0.89,
							"scaleY": 1.13,
							"scaleZ": 5,
							"rotationX": 17.8,
							"rotationY": 41.9,
							"rotationZ": 32,
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
											"emissive": 10
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.18419710791796406,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7061546999267737,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7359256098158938,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8687723795991819,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 0.14,
										"uvScaleY": 0.28,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5632248090976196,
													"value": 0.06666666666666667,
													"prevHandle": {
														"dv": -0.808452083454443,
														"dt": -0.48507125007266594
													},
													"nextHandle": {
														"dv": 0.13333333333333336,
														"dt": 0.08000000000000007
													}
												},
												{
													"time": 0.5732248090976196,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0345653634122625,
													"value": 1.3,
													"prevHandle": {
														"dv": 0,
														"dt": -0.15378018477154864
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.5
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
										"progress": 0.79,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"name": "width",
											"keys": [
												{
													"time": 0.7558526252833874,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0614001957849502,
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
										"range": 15.15,
										"power": 20
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
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6980392156862745,
											0.34901960784313724
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 0.734803617475365,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.8148036174753641,
													"value": 0.2,
													"mode": 2
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
						},
						{
							"type": "object",
							"name": "Flash",
							"x": -0.02286,
							"y": 0.0929,
							"z": 3.76954,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Yellow",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 5.930000000000001,
									"rotationX": -70.59999999999998,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.2869592120054982,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.631852092084728,
															"value": 0.05,
															"mode": 2
														},
														{
															"time": 0.7562076418049825,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7662076418049825,
															"value": 1.25,
															"mode": 2
														},
														{
															"time": 1.1252854913418215,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08163119444600841
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08163119444600841
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.2869592120054982,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.631852092084728,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.6329982617768332,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.2869592120054982,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7562076418049825,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7662076418049825,
															"value": 1.25,
															"mode": 2
														},
														{
															"time": 1.1252854913418215,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08163119444600841
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08163119444600841
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
													0.7372549019607844,
													0.43529411764705883
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.6,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 5.930000000000001,
									"rotationX": -70.59999999999998,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
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
													"keys": [
														{
															"time": 0.652819685707602,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7544441968748437,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.767516541327124,
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
													0,
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
							"name": "Distort",
							"enabled": false,
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
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
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 30,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.5,
								"animationLoop": false,
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
								},
								"instStretch": [
									1,
									1,
									0.01
								]
							},
							"z": 1,
							"scaleX": 0.10204081632653067,
							"scaleY": 0.10204081632653067,
							"scaleZ": 0.10204081632653064,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
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
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
												"intensity": 0.01
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
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.75,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 1
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0.009999999999999995,
											"value": -0.02419093677588713,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.29108698853561,
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
					"name": "ally",
					"enabled": false,
					"x": 7.98078,
					"y": 9.25611,
					"children": [
						{
							"type": "object",
							"name": "Passive",
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
											"name": "Glow",
											"z": 2.220446049250313e-16,
											"scaleX": 1.9999999999999998,
											"scaleY": 2.0000000000000004,
											"scaleZ": 2.0000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": 1.1682520729385802e-17,
											"rotationZ": -89.99999999999999,
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
															"emissive": 1,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
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
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"y": -0.009999999999999787,
											"z": 0.27735,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000004,
											"scaleZ": 1.5000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": -4.882868236569899e-18,
											"rotationZ": -89.99999999999999,
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
															1,
															0.6980392156862745,
															0.34901960784313724
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
													"time": 0.8683242346823141,
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
													"time": 1.132244135375164,
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
									"x": 0.07466,
									"y": -0.01592,
									"z": 0.06506,
									"scaleX": 2,
									"scaleY": 2.5,
									"scaleZ": 2,
									"rotationY": -90,
									"rotationZ": -90,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.8694868087836278,
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
															"time": 1.1334067094764777,
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
												"progress": 0.38,
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
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "FlashDecals",
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
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
																	"time": 0.8447844531844578,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8647829839044451,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9065689358341508,
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
											"name": "advancedDecal_White",
											"y": 0.25,
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.9048762102821043,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9367238198664162,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1319500103926499,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.9045967308844817,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9766086165682425,
																	"value": 1,
																	"mode": 2
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
														"amount": 0.6,
														"ATTENUATE": true,
														"emissiveMap": null
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
							"name": "Particles",
							"props": {
								"emitType": "Burst",
								"lifeTimeRand": 0.3,
								"burstParticleCount": 10,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.12,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"lifeTime": 0.9,
								"emitShape": "Cylinder",
								"emitRad2": 0.55,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360,
								"warmUpTime": -0.85,
								"useRandomColor": true,
								"randomColor1": [
									1,
									0.9490196078431372,
									0.8784313725490196,
									1
								],
								"randomColor2": [
									1,
									0.9019607843137255,
									0.7843137254901961,
									1
								],
								"instScale": 0.85,
								"seedGroup": 1,
								"emitOrientation": "Normal",
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
								},
								"instSpeed_rand": [
									0,
									0,
									10
								],
								"instSpeed": [
									0,
									0,
									25
								]
							},
							"x": -2.49065,
							"y": 0.57273,
							"scaleX": 1.9,
							"scaleY": 1.9,
							"scaleZ": 0.17,
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
													"emissive": 50
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.065,
															"value": 1,
															"prevHandle": {
																"dv": 0.11089160652646488,
																"dt": -0.015692208470726162
															},
															"nextHandle": {
																"dv": -0.8833333333333333,
																"dt": 0.12500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.8384636488340191
															},
															"nextHandle": {
																"dv": 0.006154423696995358,
																"dt": 0.30991955512506614
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
												"envBlend": 0.7,
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.56
											},
											"nextHandle": {
												"dv": 0.03967621425974007,
												"dt": 0.3332801997818148
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": 0.013194444444444398,
												"dt": -0.8841852909175679
											},
											"nextHandle": {
												"dv": -0.006407488794313876,
												"dt": 0.33335250704975594
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"keys": [
										{
											"time": 0,
											"value": 4,
											"prevHandle": {
												"dv": 4.093979236902871,
												"dt": -0.014066889347596315
											},
											"nextHandle": {
												"dv": -3.407170046487326,
												"dt": 0.011640960349275753
											}
										},
										{
											"time": 1,
											"value": -0.75,
											"prevHandle": {
												"dv": -0.2822334196776164,
												"dt": -1.1294089163140315
											},
											"nextHandle": {
												"dv": 0.07924705219885098,
												"dt": 0.33328592224694964
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": 0.049851314927107426,
												"dt": -0.5043451509891843
											},
											"nextHandle": {
												"dv": -0.03306904715719971,
												"dt": 0.3331829822235662
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
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
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.77,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": ".FXRoot.ally.Passive",
					"target": ".FXRoot.Otheym.Female01_Infiltrator.root.B_ROOTJ.B_Spine01J.B_Spine02J"
				},
				{
					"type": "object",
					"name": "ally02",
					"enabled": false,
					"x": 7.98078,
					"y": 12.93882,
					"children": [
						{
							"type": "object",
							"name": "Passive02",
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 1.1,
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
											"name": "Glow",
											"z": 2.220446049250313e-16,
											"scaleX": 1.9999999999999998,
											"scaleY": 2.0000000000000004,
											"scaleZ": 2.0000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": 1.1682520729385802e-17,
											"rotationZ": -89.99999999999999,
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
															"emissive": 1,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
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
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"y": -0.009999999999999787,
											"z": 0.27735,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000004,
											"scaleZ": 1.5000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": -4.882868236569899e-18,
											"rotationZ": -89.99999999999999,
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
															1,
															0.6980392156862745,
															0.34901960784313724
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
													"time": 0.8683242346823141,
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
													"time": 1.132244135375164,
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
									"x": 0.07466,
									"y": -0.01592,
									"z": 0.06506,
									"scaleX": 2,
									"scaleY": 2.5,
									"scaleZ": 2,
									"rotationX": -180,
									"rotationZ": -90,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.8694868087836278,
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
															"time": 1.1334067094764777,
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
												"progress": 0.38,
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
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "FlashDecals",
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
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
																	"time": 0.8447844531844578,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8647829839044451,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9065689358341508,
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
											"name": "advancedDecal_White",
											"y": 0.25,
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.9048762102821043,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9367238198664162,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1319500103926499,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.9045967308844817,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9766086165682425,
																	"value": 1,
																	"mode": 2
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
														"amount": 0.6,
														"ATTENUATE": true,
														"emissiveMap": null
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
							"name": "Particles",
							"props": {
								"emitType": "Burst",
								"lifeTimeRand": 0.3,
								"burstParticleCount": 10,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.12,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"lifeTime": 0.9,
								"emitShape": "Cylinder",
								"emitRad2": 0.55,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360,
								"warmUpTime": -0.85,
								"useRandomColor": true,
								"randomColor1": [
									1,
									0.9490196078431372,
									0.8784313725490196,
									1
								],
								"randomColor2": [
									1,
									0.9019607843137255,
									0.7843137254901961,
									1
								],
								"instScale": 0.85,
								"seedGroup": 1,
								"emitOrientation": "Normal",
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
								},
								"instSpeed_rand": [
									0,
									0,
									10
								],
								"instSpeed": [
									0,
									0,
									25
								]
							},
							"x": -2.49065,
							"y": 0.57273,
							"scaleX": 1.9,
							"scaleY": 1.9,
							"scaleZ": 0.17,
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
													"emissive": 50
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.065,
															"value": 1,
															"prevHandle": {
																"dv": 0.11089160652646488,
																"dt": -0.015692208470726162
															},
															"nextHandle": {
																"dv": -0.8833333333333333,
																"dt": 0.12500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.8384636488340191
															},
															"nextHandle": {
																"dv": 0.006154423696995358,
																"dt": 0.30991955512506614
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
												"envBlend": 0.7,
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.56
											},
											"nextHandle": {
												"dv": 0.03967621425974007,
												"dt": 0.3332801997818148
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": 0.013194444444444398,
												"dt": -0.8841852909175679
											},
											"nextHandle": {
												"dv": -0.006407488794313876,
												"dt": 0.33335250704975594
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"keys": [
										{
											"time": 0,
											"value": 4,
											"prevHandle": {
												"dv": 4.093979236902871,
												"dt": -0.014066889347596315
											},
											"nextHandle": {
												"dv": -3.407170046487326,
												"dt": 0.011640960349275753
											}
										},
										{
											"time": 1,
											"value": -0.75,
											"prevHandle": {
												"dv": -0.2822334196776164,
												"dt": -1.1294089163140315
											},
											"nextHandle": {
												"dv": 0.07924705219885098,
												"dt": 0.33328592224694964
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
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
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": ".FXRoot.ally02.Passive02",
					"target": ".FXRoot.Otheym.Female01_Infiltrator01.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
				}
			]
		},
		{
			"type": "object",
			"name": "BACKUP",
			"enabled": false,
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
			"children": [
				{
					"type": "object",
					"name": "Otheym",
					"editorOnly": true,
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
									"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_Skill.fbx"
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
							"type": "model",
							"name": "Bazooka_mat",
							"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
							"x": -0.00012,
							"y": 0.00102,
							"z": 0.00676,
							"scaleX": 1.1,
							"scaleY": 1.01,
							"scaleZ": 1.1,
							"rotationX": -98.5,
							"rotationY": -0.7,
							"rotationZ": 2,
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
											"emissive": 20
										}
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": -0.15,
										"scale": 1,
										"power": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.4511179929140826,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.4611179929140826,
													"value": 1,
													"mode": 1
												},
												{
													"time": 0.6732068509640925,
													"value": 0,
													"mode": 1
												},
												{
													"time": 1.0222470186344375,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.11384693995679285
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06526080676176826
													}
												},
												{
													"time": 1.0845414250888525,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 2
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -319772357
													},
													{
														"position": 1,
														"color": -319035707
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
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Otheym.Bazooka",
							"target": "FXAnimation.FXRoot.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Otheym.Bazooka_mat",
							"target": "FXAnimation.FXRoot.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "object",
					"name": "Skill",
					"children": [
						{
							"type": "object",
							"name": "Charge",
							"x": 3.10811,
							"y": 0.34673,
							"z": 4.56414,
							"children": [
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											2,
											2,
											1.5
										],
										"lifeTime": 0.35,
										"lifeTimeRand": 0.1,
										"warmUpTime": -1,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 13,
										"instScale_rand": 0.1,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
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
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
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
															"emissive": 5
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
														"uScale": 7,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
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
																	"time": 0.9964190873914609,
																	"value": 0,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
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
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.3136958552692092,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
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
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -3.49091,
									"y": 0.36088,
									"z": 4.9364,
									"scaleX": 0.71,
									"scaleY": 0.9,
									"scaleZ": 4,
									"rotationX": 3.3,
									"rotationY": 145,
									"rotationZ": 0.8,
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
													"emissive": 1
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": -0.18,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.49088138492302935,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0128389769318393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.04260988682096,
															"value": 2,
															"mode": 2
														},
														{
															"time": 1.1754566566042495,
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
													0.5098039215686274,
													0.8117647058823529,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.4988555451082961,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4380516180972593,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.4,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 0.28,
												"texture": "Fx/noise/Wave_01.jpg",
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.53,
												"scaleY": 1,
												"shiftX": 1,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8699090861026851,
															"value": 0.06666666666666667,
															"prevHandle": {
																"dv": -0.808452083454443,
																"dt": -0.48507125007266594
															},
															"nextHandle": {
																"dv": 0.13333333333333336,
																"dt": 0.08000000000000007
															}
														},
														{
															"time": 0.8799090861026851,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.341249640417331,
															"value": 1.3
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
												"progress": 0.79,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/T_Square03.jpg",
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
													"name": "width",
													"keys": [
														{
															"time": 1.0625369022884537,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3680844727900188,
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
												"range": 15.15,
												"power": 20
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.98,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/uGrad.png",
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.376756682030103,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.456756682030103,
															"value": 0.2,
															"mode": 2
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
							"name": "Step",
							"x": 2.91227,
							"scaleX": 1.7,
							"scaleY": 1.7,
							"scaleZ": 1.7,
							"children": [
								{
									"type": "emitter",
									"name": "HeatWave_Distort",
									"props": {
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											0.8313725490196078
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 20,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 0,
										"warmUpTime": -0.45,
										"emitType": "Burst",
										"lifeTime": 0.75,
										"burstDelay": 0.55,
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
															"colorMask": 255,
															"depthTest": "LessEqual"
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
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.8,
														"sandColorSet": false,
														"envBlend": 0.2,
														"envColorSet": false
													}
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
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
														"intensity": 0.016
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 1,
											"keys": [
												{
													"time": -0.008955438443594144,
													"value": 0
												},
												{
													"time": 1.199261029354163,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5333333333333333,
														"dt": -0.4725329589843752
													},
													"nextHandle": {
														"dv": 0.016666666666666607,
														"dt": 0.31836303710937575
													}
												},
												{
													"time": 3.140094610862653,
													"value": 0.9833333333333334,
													"prevHandle": {
														"dv": 0.016666666666666607,
														"dt": -0.21809168368578025
													},
													"nextHandle": {
														"dv": -0.049836898730717664,
														"dt": 0.6521407892315909
													}
												},
												{
													"time": 5.952119635515775,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5
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
													"value": 0.1,
													"prevHandle": {
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
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
									"type": "emitter",
									"name": "Shockwave",
									"props": {
										"warmUpTime": -0.45,
										"emitType": "Burst",
										"instScale": 15,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"lifeTime": 0.75,
										"burstDelay": 0.55,
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
									"z": 0.1,
									"scaleX": 0.010000000000000002,
									"scaleY": 0.010000000000000002,
									"scaleZ": 0.010000000000000002,
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
															"depthTest": "LessEqual",
															"drawOrder": "100"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
													}
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
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
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
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
													"prevHandle": {
														"dv": -2.090031350705387,
														"dt": -0.3895058426314596
													},
													"nextHandle": {
														"dv": 1.1,
														"dt": 0.20671875000000048
													}
												},
												{
													"time": 0.8467187500000021,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.9725490196078431,
													0.9725490196078431
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "Shockwave",
									"props": {
										"warmUpTime": -1,
										"emitType": "Burst",
										"instScale": 20,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"lifeTime": 0.75,
										"burstDelay": 0.55,
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
									"z": 0.5,
									"scaleX": 0.010000000000000002,
									"scaleY": 0.010000000000000002,
									"scaleZ": 0.010000000000000002,
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
															"depthTest": "LessEqual",
															"drawOrder": "100"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
													}
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
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
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
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.41712157155829,
																		"dt": -0.45256463091700333
																	},
																	"nextHandle": {
																		"dv": -1.0333333333333334,
																		"dt": 0.33171875000000084
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
													"prevHandle": {
														"dv": -2.090031350705387,
														"dt": -0.3895058426314596
													},
													"nextHandle": {
														"dv": 1.1,
														"dt": 0.20671875000000048
													}
												},
												{
													"time": 0.8467187500000021,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.9725490196078431,
													0.9725490196078431
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											2,
											2,
											1.3
										],
										"lifeTime": 0.35,
										"lifeTimeRand": 0.1,
										"warmUpTime": -0.45,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 9,
										"instScale_rand": 0.1,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
										"burstDelay": 0.55,
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
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
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
															"emissive": 5
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
														"uScale": 7,
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"time": 0,
																	"value": 0.5,
																	"mode": 1,
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
																	"time": 0.9964190873914609,
																	"value": 0,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 1,
																	"value": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
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
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.3136958552692092,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
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
									"name": "Hit",
									"props": {
										"emitType": "Burst",
										"instScale_rand": 0,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"warmUpTime": 0.55,
										"lifeTime": 1.5,
										"instScale": 1.45,
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
									"z": 0.05,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
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
															"emissive": 8,
															"drawOrder": "120"
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
														"texture": "Fx/Alphas/T_FlatImpact02.png"
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
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.61,
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
																	"time": 0.7050000000000001,
																	"value": 0.9419580650329591,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.8723667347431184,
																		"dt": 0.07999999999999996
																	}
																},
																{
																	"time": 0.95,
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.5,
														"envColorSet": false
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
															0.7529411764705882,
															0.27058823529411763,
															0.16078431372549018
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
																	"value": 0.2,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
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
													"prevHandle": {
														"dv": -0.03236093441864362,
														"dt": -0.49997643676805403
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.5149999999999999
													}
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
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"fadePower": 3,
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.45633401078846725,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46633401078846726,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.6739007938048307,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07950373574056242
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07950373574056242
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.47008708821305567,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.4800870882130557,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.585988651789465,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.0001814337771993,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.073135844240948,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.967162280383077,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.977162280383077,
															"value": 1,
															"mode": 1
														},
														{
															"time": 2.2142454653587293,
															"value": 0.2,
															"mode": 1
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"enabled": false,
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.45633401078846725,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46633401078846726,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.6739007938048307,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07950373574056242
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07950373574056242
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
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"scaleX": 7,
									"scaleY": 7,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"fadePower": 3,
									"emissive": 10,
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
															"time": 0.45633401078846725,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46633401078846726,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.6739007938048307,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07950373574056242
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07950373574056242
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.47008708821305567,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.4800870882130557,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.585988651789465,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.0001814337771993,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.073135844240948,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.967162280383077,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.977162280383077,
															"value": 1,
															"mode": 1
														},
														{
															"time": 2.2142454653587293,
															"value": 0.2,
															"mode": 1
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.45633401078846725,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46633401078846726,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.6739007938048307,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07950373574056242
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.07950373574056242
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
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Round_Sand_Stylised",
									"x": 0.05907,
									"y": -0.02716,
									"z": 0.07087,
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 0.2,
									"rotationZ": 89.99999999999997,
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
													"emissive": 0.3,
													"drawOrder": "110"
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
												"texture": "Fx/Alphas/T_FlatImpact.png"
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
															"time": 0.9787381579306973,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.9787381579306973,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -1.0614035807794995,
																"dt": 0.24955175517728168
															}
														},
														{
															"time": 1.8049403037329792,
															"value": 0.0002485722671614621,
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
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.0302755952426232,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.010893013836548135
													}
												},
												{
													"time": 1.0645496787329791,
													"value": 0.4,
													"prevHandle": {
														"dv": -0.018726500684397046,
														"dt": -0.003303737957172996
													},
													"nextHandle": {
														"dv": 0.5269202398255781,
														"dt": 0.09254882812499987
													}
												},
												{
													"time": 1.9335242881079828,
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
							"type": "object",
							"name": "Hand",
							"x": 0.01256,
							"y": -0.35459,
							"children": [
								{
									"type": "model",
									"name": "Missile",
									"source": "Character/Fremen/Weapon/Bazooka/Missile.fbx",
									"x": 0.09267,
									"y": -0.00051,
									"z": -0.03967,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": 52.2,
									"rotationZ": 110.9,
									"children": [
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.554666634784977,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5809646529266905,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9973226541908187,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.030243984523331,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Missile",
									"source": "Character/Fremen/Weapon/Bazooka/Missile.fbx",
									"x": 0.09267,
									"y": -0.00051,
									"z": -0.03967,
									"scaleX": 1.25,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": 52.2,
									"rotationZ": 110.9,
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
													"emissive": 20
												}
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													0,
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -319772357
															},
															{
																"position": 1,
																"color": -319035707
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
															"time": 0.7561467311641685,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08978707685423037
															}
														},
														{
															"time": 1.0255079617268597,
															"value": 1,
															"mode": 1
														},
														{
															"time": 1.0437662637160618,
															"value": 0,
															"mode": 1
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "flare",
									"enabled": false,
									"scaleX": 0.35,
									"scaleY": 0.35,
									"scaleZ": 0.35,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_FlareBlack",
											"enabled": false,
											"props": {
												"lifeTime": 0.35,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.5,
												"instScale": 1.5,
												"instStretch": [
													15,
													8,
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
												"emitType": "Burst",
												"warmUpTime": -0.85,
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
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1.25,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare06_512.png"
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
															"time": 0.006831217655519195,
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
															"time": 1.0068312176555192,
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
															"time": 0.006831217655519195,
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
															"time": 1.0068312176555192,
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
										},
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													12,
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
												"warmUpTime": -0.9,
												"emitType": "Burst",
												"instScale": 1.25,
												"simulationSpace": "World",
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
																			"time": 0.006831217655519195,
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
																			"time": 0.18783894350739566,
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
															"time": 0.006831217655519195,
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
															"time": 1.0068312176555192,
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
															"time": 0.006831217655519195,
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
															"time": 1.0068312176555192,
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
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"enabled": false,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.59,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"fadePower": 3,
									"emissive": 10,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.586258899665245,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15819684594141534
															}
														},
														{
															"time": 1.060849437489491,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2255602712049647,
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
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flare2",
							"x": 3.163267899074443,
							"y": 0.3468220372537208,
							"z": 4.607132489779724,
							"scaleX": 0.9799999999999996,
							"scaleY": 0.9799999999999995,
							"scaleZ": 0.9799999999999998,
							"rotationX": -73.1659119673812,
							"rotationY": 63.18281451680198,
							"rotationZ": -86.78816396976663,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											18,
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
										"warmUpTime": -1,
										"emitType": "Burst",
										"instScale": 2.65,
										"simulationSpace": "World",
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
																	"time": 0.006831217655519195,
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
																	"time": 0.18783894350739566,
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
													"time": 0.006831217655519195,
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
													"time": 1.0068312176555192,
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
													"time": 0.006831217655519195,
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
													"time": 1.0068312176555192,
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
						},
						{
							"type": "object",
							"name": "DecalBazooka",
							"y": 0.0535,
							"z": 0.0304,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"y": -0.06944,
									"z": 0.0304,
									"scaleX": 2.5,
									"scaleY": 0.6,
									"scaleZ": 0.59,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"fadePower": 3,
									"emissive": 10,
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
															"time": 1.020765715723985,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0526133253082968,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1832508968329853,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08163119444600841
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08163119444600841
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9450980392156862,
													0.3058823529411765,
													0.16078431372549018
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.1300033629211388,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.00978182452443758
															},
															"nextHandle": {
																"dv": -0.03417340777450917,
																"dt": 0.09904221378551759
															}
														},
														{
															"time": 1.2350481351179,
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
											"enabled": false,
											"props": {
												"amount": 0.7,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Red",
									"z": 0.0304,
									"scaleX": 2.5,
									"scaleY": 0.6,
									"scaleZ": 0.59,
									"rotationY": 90,
									"albedoMap": "Fx/Gradients/circGrad01.png",
									"fadePower": 3,
									"emissive": 10,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.25
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.45620653458493066,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.46620653458493067,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.6732068509640925,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.9909789580933015,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.0639333685570502,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0.05,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.47008708821305567,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.4800870882130557,
															"value": 0.5,
															"mode": 1
														},
														{
															"time": 0.585988651789465,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.0001814337771993,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08294614300775238
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.11003003950926027
															}
														},
														{
															"time": 1.073135844240948,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2340860971668897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.967162280383077,
															"value": 0,
															"mode": 1
														},
														{
															"time": 1.977162280383077,
															"value": 1,
															"mode": 1
														},
														{
															"time": 2.2142454653587293,
															"value": 0.2,
															"mode": 1
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
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 0.75
											}
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"enabled": false,
									"x": 0.05628,
									"y": 0.00233,
									"z": -0.02737,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
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
											"name": "WhiteFlames",
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
													"time": 0.8918696422213772,
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
													"time": 1.1557895429142269,
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
									"type": "emitter",
									"name": "emitter_ElecRound",
									"enabled": false,
									"props": {
										"emitRate": 1,
										"maxCount": 8,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.05,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											90,
											90,
											360
										],
										"emitType": "InfinityRandom",
										"emitRateMin": 1,
										"emitRateChangeDelay": 0.1,
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
											"type": "model",
											"name": "Swirl",
											"source": "Fx/Event/Swirl.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 4.5,
											"rotationX": 25.4,
											"rotationZ": -94.4,
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
															"emissive": 40
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_04.png",
														"speed": 20,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true,
														"useSourceUVs": true,
														"blendBetweenFrames": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
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
														"progress": 0.5,
														"saturation": 0,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "emitRateMax",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"enabled": false,
									"editorOnly": true,
									"x": 0.04938,
									"y": -0.14264,
									"z": -0.04748,
									"scaleX": 0.9999999999999998,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
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
											"name": "WhiteFlames",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
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
															"emissive": 1,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													}
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
													"enabled": false,
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
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"enabled": false,
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
															"emissive": 1,
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
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
													"enabled": false,
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
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 3
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "elec",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
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
													"enabled": false,
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
														"texture": "Fx/Alphas/T_circle2.png"
													}
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
													"enabled": false,
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
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricStar_4x4.png",
														"speed": 20,
														"frameDivision": [
															4,
															4
														],
														"totalFrames": 16,
														"startTime": 0,
														"loop": true,
														"useSourceUVs": true,
														"blendBetweenFrames": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
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
														"progress": 0.5,
														"saturation": 1,
														"width": 0.54,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/FlareNoise.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															1,
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
															0.9882352941176471,
															0.5176470588235293,
															0.2
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
															1,
															0.9803921568627451,
															0.9686274509803922
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 3
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
													"time": 1.9361019461765823,
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
													"time": 2.200021846869432,
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
													"time": 0.8918696422213772,
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
													"time": 1.1557895429142269,
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
									"type": "emitter",
									"name": "emitterElec",
									"enabled": false,
									"editorOnly": true,
									"props": {
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.25,
										"spriteSheet": "Fx/Alphas/T_ElectricStar_4x4.png",
										"lifeTime": 0.5,
										"warmUpTime": -2,
										"emitRate": 3,
										"maxCount": 5,
										"instScale": 1.75,
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
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
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
													0.9882352941176471,
													0.5176470588235293,
													0.2
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
													0.984313725490196,
													0.803921568627451,
													0.6941176470588235
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
												"width": 0.58,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Fire.png",
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
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.4658385093167702,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keys": [
														{
															"time": 0.1956521739130435,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.38198757763975155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5419254658385093,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.7981366459627329,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 4
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter",
									"enabled": false,
									"props": {
										"alignMode": "Screen",
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0.25,
										"lifeTime": 0.25,
										"warmUpTime": -2,
										"emitRate": 3,
										"maxCount": 5,
										"instScale": 2.5,
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
											},
											"diffuseMap": "Fx/Alphas/T_circle2.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.05298271179199232,
																"dt": 0.2629399585921325
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.647525405883789,
																"dt": -0.3892339544513458
															},
															"nextHandle": {
																"dv": -0.6284454891130702,
																"dt": 0.3744619621591775
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
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
													0.984313725490196,
													0.803921568627451,
													0.6941176470588235
												]
											}
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.58,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Fire.png",
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
													"keys": [
														{
															"time": 0.1956521739130435,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.38198757763975155,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5419254658385093,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.7981366459627329,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 4
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.75,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.6833333333333333,
														"dt": 0.2935636194898899
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.789400012105079
													},
													"nextHandle": {
														"dv": -4.2643607359693687e-16,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"x": 1.20251,
							"y": -0.33862,
							"z": 3.60423,
							"scaleX": 9,
							"scaleY": 9,
							"scaleZ": 6.67,
							"rotationX": -70.6,
							"rotationY": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
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
											"keys": [
												{
													"time": 0.9420515734873213,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9972438358094845,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0103161802617648,
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
							"name": "advancedDecal_White",
							"x": 0.5048,
							"y": -0.09292,
							"z": 3.35759,
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 5.19,
							"rotationX": -70.6,
							"rotationY": 90,
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
													"time": 1.020765715723985,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0526133253082968,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2515366930100886,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.08163119444600841
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.08163119444600841
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
											0.9450980392156862,
											0.3058823529411765,
											0.16078431372549018
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 1.1300033629211388,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.00978182452443758
													},
													"nextHandle": {
														"dv": -0.03417340777450917,
														"dt": 0.09904221378551759
													}
												},
												{
													"time": 1.2350481351179,
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
										"amount": 0.7,
										"color": [
											0.9882352941176471,
											0.5176470588235293,
											0.2
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Distort",
							"props": {
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
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
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 0.6,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 25,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.9,
								"animationLoop": false,
								"alignMode": "Screen",
								"instStretch": [
									1,
									1,
									0.01
								],
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
							"x": 1.17835,
							"y": -0.37,
							"z": 2.34081,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
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
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin2Normal.jpg",
												"intensity": 0.02
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
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.75,
												"scaleY": 0.75,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.01
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 1
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
											"time": 0.009999999999999995,
											"value": -0.02419093677588713,
											"prevHandle": {
												"dv": -0.6101554739171128,
												"dt": -0.33018814592265844
											},
											"nextHandle": {
												"dv": 0.9136438538946278,
												"dt": 0.49018439845683004
											}
										},
										{
											"time": 1,
											"value": 1.29108698853561,
											"prevHandle": {
												"dv": -0.11323294039229448,
												"dt": -0.39715416696622907
											},
											"nextHandle": {
												"dv": 0.09487993739524597,
												"dt": 0.33286343471616847
											}
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
					"object": "FXAnimation.FXRoot.Skill.Hand",
					"target": "FXAnimation.FXRoot.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon.B_Weapon_Add"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Skill.DecalBazooka",
					"target": "FXAnimation.FXRoot.Otheym.Bazooka"
				}
			]
		}
	]
}