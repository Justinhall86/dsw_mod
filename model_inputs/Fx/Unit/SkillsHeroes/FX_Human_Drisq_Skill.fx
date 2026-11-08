{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 150,
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
					"name": "Drisq",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "DrisqSniper",
							"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqSniper.fbx",
							"editorOnly": true,
							"scaleY": 1.0000000000000007,
							"scaleZ": 1.0000000000000007,
							"rotationX": -89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Smuggler/Unit/Drisq/Female01_SmugglersDrisq.fbx",
							"editorOnly": true,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Drisq/Anim_Female01_Drisq_Skill.fbx"
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"editorOnly": true,
							"object": ".FXRoot.Drisq.DrisqSniper",
							"target": ".FXRoot.Drisq.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "emitter",
					"name": "Douille",
					"props": {
						"lifeTime": 2,
						"warmUpTime": -0.65,
						"emitType": "Burst",
						"simulationSpace": "World",
						"maxCount": 1,
						"emitShape": "Cone",
						"emitAngle": 35.45,
						"alignMode": "Screen",
						"instSpeed": [
							20,
							0,
							-3
						],
						"instAcceleration": [
							0,
							0,
							-50
						],
						"instScale": 0.45,
						"instRotation": [
							0,
							0,
							720
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instStretch": [
							1,
							0.4,
							1
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
					"x": 0.09186,
					"y": 0.1674,
					"z": 2.70065,
					"rotationX": -3.4,
					"rotationY": -42.6,
					"rotationZ": 97.1,
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
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle5.png"
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
											0.3686274509803922,
											0.14901960784313725
										]
									}
								},
								{
									"type": "shader",
									"name": "Dissolve",
									"source": "shaders/Dissolve.hx",
									"props": {
										"progress": 0.23,
										"saturation": 1,
										"width": 1,
										"useAlpha": false
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2611111111111111,
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
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"prevHandle": {
										"dv": 8.273459945837056,
										"dt": -0.3668803370090847
									},
									"nextHandle": {
										"dv": -0.8333333333333334,
										"dt": 0.037593570889227004
									}
								},
								{
									"time": 0.20405557181738693,
									"value": 0.1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instAcceleration.z",
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.06240034389496513,
									"value": 0.1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instRotation.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 360,
									"prevHandle": {
										"dv": -531.7918680100018,
										"dt": -0.49544779633626745
									},
									"nextHandle": {
										"dv": 306.5487670898442,
										"dt": 0.28258183947003385
									}
								},
								{
									"time": 1.000096363511866,
									"value": 720,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "FlashDecals",
					"z": 2.21655,
					"rotationZ": 90,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"y": 0.24715,
							"z": 0.85973,
							"scaleX": 6.5,
							"scaleY": 4,
							"scaleZ": 2.5,
							"rotationX": -107,
							"rotationY": 90,
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
													"time": 0.6182638532786209,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6336258238881902,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6944860220373014,
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
							"name": "advancedDecal_Blue",
							"y": 0.24715,
							"z": 0.85973,
							"scaleX": 6.5,
							"scaleY": 4,
							"scaleZ": 2.5,
							"rotationX": -107,
							"rotationY": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 1,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7064225005410683,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7618172146051594,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 1.4040467112042974,
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
											0.43529411764705883,
											0.7176470588235294,
											0.984313725490196
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"y": 0.24715,
							"z": 0.85973,
							"scaleX": 6.5,
							"scaleY": 4,
							"scaleZ": 2.5,
							"rotationX": -107,
							"rotationY": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 5,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.673908658421381,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6893507030637847,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9182648513604318,
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
								},
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
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "FlareVertical",
					"enabled": false,
					"x": 5.551115123125783e-17,
					"z": 0.3145,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt_FlareWhite",
							"x": 1.6653345369377348e-16,
							"z": -0.51608,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 1.5,
							"rotationZ": -5.75228976444653,
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
									"scaleY": 13.33,
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
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"onDecal": false
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													1
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
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4996502076821233,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6896502076821209,
															"value": 1,
															"prevHandle": {
																"dv": 0.0017958704086967704,
																"dt": -0.019991355089287063
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.1859797889977044
															}
														},
														{
															"time": 1.3394569658678535,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.21660225272857833
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.21660225272857833
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
												"range": 10,
												"power": 0.8
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
													0.43529411764705883,
													0.7176470588235294,
													0.984313725490196
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.20385750319887413,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.5695954526343497,
															"value": 0.25,
															"prevHandle": {
																"dv": 0.00757687696833834,
																"dt": -0.06406311509621984
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.28150569319861213
															}
														},
														{
															"time": 1.2935007704400263,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.2413017726018937
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
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
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.1424516018872883,
											"value": 0,
											"prevHandle": {
												"dv": 1.2689047981708326e-16,
												"dt": -0.185376816581116
											},
											"nextHandle": {
												"dv": 0.000500000000000167,
												"dt": 0.48216615264372065
											}
										},
										{
											"time": 0.6846424211318126,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.0393336328638334,
											"value": 1.8000000000000012,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_FlareLarge",
							"enabled": false,
							"x": 5.551115123125783e-17,
							"z": 2.3073400000000004,
							"scaleX": 0.65,
							"scaleY": 0.65,
							"scaleZ": 0.65,
							"rotationZ": -11.181673123270484,
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
													"parallax": 0
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.2578858648768864,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16476603413671187
															}
														},
														{
															"time": 0.6012144995408185,
															"value": 1,
															"prevHandle": {
																"dv": 1.1982918773345965e-17,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1631845379661978
															}
														},
														{
															"time": 1.7475889541513852,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16908525475904299
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16908525475904299
															}
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 2
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9921568627450981,
													0.4666666666666667,
													0.9019607843137255
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.0885013645779584,
															"value": 0,
															"prevHandle": {
																"dv": 0.00757687696833834,
																"dt": -0.06406311509621984
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.28150569319861213
															}
														},
														{
															"time": 0.7773667445740902,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22962179333204405
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
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
				},
				{
					"type": "object",
					"name": "Tornado",
					"enabled": false,
					"z": 2.17706,
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.78,
					"children": [
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
										"uvShift": [
											0,
											0.02
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
										"progress": 0.22,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0.02
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
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.0126944331241845,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.1176089483662226,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.5145303159958959,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.307197356402889,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.8448509905109625,
													"value": 0.85,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
													}
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
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Wave.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6251665261928128,
													"value": 0,
													"prevHandle": {
														"dv": -0.8181222043870895,
														"dt": -0.4501626227043787
													},
													"nextHandle": {
														"dv": 0.1742460963956094,
														"dt": 0.0983726115211403
													}
												},
												{
													"time": 0.8191321566487269,
													"value": 1,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7204576155530557,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.7513301797893748,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.0559322506969093,
													"value": -0.014914336029688502,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7204576155530557,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.724000076357221,
													"value": 0,
													"prevHandle": {
														"dv": 0.0007442731918721468,
														"dt": -0.7338927659453209
													},
													"nextHandle": {
														"dv": -1.5119282697350795e-16,
														"dt": 0.4815594802394449
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
										"range": 2,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
										"uvShift": [
											0,
											0.02
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
										"progress": 0.22,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0.02
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
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.0126944331241845,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.1176089483662226,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.5145303159958959,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.307197356402889,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.2749419079592304,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.8448509905109625,
													"value": 0.85,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"envBlend": 0.5,
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
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7204576155530557,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.7513301797893748,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.0559322506969093,
													"value": -0.014914336029688502,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7204576155530557,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 3.7827623381089235,
													"value": 0,
													"prevHandle": {
														"dv": 0.009584678049055162,
														"dt": -2.251821930745909
													},
													"nextHandle": {
														"dv": -0.0032660472019664325,
														"dt": 0.48155273981546975
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
										"range": 2,
										"power": 0.8
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
													"time": 0.8101631251131008,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9452962788950058,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.045044384593967944
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3771380493252639
													}
												},
												{
													"time": 1.867608948366222,
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
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.43529411764705883,
									0.7176470588235294,
									0.984313725490196
								]
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
								"bias": 0.8,
								"scale": 1,
								"power": 1,
								"color": [
									1,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Tornado",
					"enabled": false,
					"z": 2.17706,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
										"uvShift": [
											0,
											0.02
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
										"progress": 0.22,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0.02
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
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 0.9476249386667263,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.0525394539087645,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.4494608215384378,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.2421278619454308,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.7797814960535043,
													"value": 0.85,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
													}
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
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Wave.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5600970317353546,
													"value": 0,
													"prevHandle": {
														"dv": -0.8181222043870895,
														"dt": -0.4501626227043787
													},
													"nextHandle": {
														"dv": 0.1742460963956094,
														"dt": 0.0983726115211403
													}
												},
												{
													"time": 0.7540626621912687,
													"value": 1,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6553881210955975,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.6862606853319166,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 1.99086275623945,
													"value": -0.014914336029688502,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6553881210955975,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.658930581899764,
													"value": 0,
													"prevHandle": {
														"dv": 0.0007442731918721468,
														"dt": -0.7338927659453209
													},
													"nextHandle": {
														"dv": -1.5119282697350795e-16,
														"dt": 0.4815594802394449
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
										"range": 2,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
										"uvShift": [
											0,
											0.02
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
										"progress": 0.22,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
										"uvShift": [
											0,
											0.02
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
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 0.9476249386667263,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.0525394539087645,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.4494608215384378,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.2421278619454308,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.20987241350177208,
													"value": -0.4948720932006838,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.7797814960535043,
													"value": 0.85,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"envBlend": 0.5,
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
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6553881210955975,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.6862606853319166,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 1.99086275623945,
													"value": -0.014914336029688502,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6553881210955975,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 3.7176928436514642,
													"value": 0,
													"prevHandle": {
														"dv": 0.009584678049055162,
														"dt": -2.251821930745909
													},
													"nextHandle": {
														"dv": -0.0032660472019664325,
														"dt": 0.48155273981546975
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
										"range": 2,
										"power": 0.8
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
													"time": 0.7450936306556427,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8802267844375476,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.045044384593967944
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3771380493252639
													}
												},
												{
													"time": 1.8025394539087638,
													"value": 0,
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
					"type": "model",
					"name": "Knee",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"x": 0.79998,
					"y": -0.8061,
					"z": 6.64602,
					"scaleX": 0.49999999999999994,
					"scaleY": 0.6299999999999999,
					"scaleZ": 3,
					"rotationX": -9.4,
					"rotationY": -172.2,
					"rotationZ": -1.5,
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
									"emissive": 5
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
								"alpha": 3.56,
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
											"time": 0.07044130156857524,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.46275367972655895,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6221698034665064,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7550165732497959,
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
								"progress": 0.37,
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
											"time": 0.4494690027482307,
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
											"time": 0.6122666036126819,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9208095570628775,
											"value": 1.3,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10284765115006518
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
											"time": 0.6420968189340001,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9476443894355652,
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
									0.3764705882352941,
									0.7607843137254902,
									1
								]
							}
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
						"warmUpTime": 0.35,
						"lifeTime": 1.5,
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
						"instScale": 0.6
					},
					"x": 0.44031,
					"z": 3.07572,
					"scaleX": 0.09999999999999998,
					"scaleY": 0.09999999999999998,
					"scaleZ": 0.09999999999999998,
					"rotationY": 11.2,
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
											"emissive": 10,
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
										"texture": "Fx/Alphas/T_FlatImpact.png"
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.3764705882352941,
											0.7607843137254902,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 0.07841546175384197,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0176115347428054,
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
					"type": "object",
					"name": "Impact",
					"z": 0.79429,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"rotationZ": 26.6,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": -0.27604,
							"z": 0.80408,
							"scaleX": 4.3,
							"scaleY": 4.75,
							"scaleZ": 4.75,
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
													"time": 0.6105944901535494,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6904702665510642,
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
													"time": 0.6362655466405217,
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
													"time": 1.1600118732140337,
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
											"time": 0.6206868595153832,
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
											"time": 1.1344721357155831,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.3764705882352941,
											0.7607843137254902,
											1
										]
									}
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
								"warmUpTime": -0.65,
								"emitType": "Burst",
								"instScale": 0.4,
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
							"x": -0.15167000000000003,
							"y": 6.938893903907228e-18,
							"z": 0.83551,
							"scaleX": 0.10000000000000003,
							"scaleY": 0.10000000000000003,
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
				},
				{
					"type": "lookAt",
					"name": "lookAtUP",
					"x": -0.07214,
					"y": 0.07648,
					"z": 1.5,
					"scaleY": 3.5,
					"scaleZ": 1.5,
					"rotationZ": 3.388453267087203,
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
							"scaleX": 0.45,
							"scaleY": 20,
							"scaleZ": 0.7499392354141005,
							"rotationX": 90,
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
											"depthTest": "LessEqual",
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
										"texture": "Fx/Alphas/T_Flare06_512.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.5570115178481029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6703564308287411,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4083543939205867,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
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
										"range": 15,
										"power": 0.8
									}
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5737505841303708,
											"value": 0.25,
											"prevHandle": {
												"dv": 0.002404241294978398,
												"dt": -0.015494497741857334
											},
											"nextHandle": {
												"dv": -0.01414688773777184,
												"dt": 0.1249143940058296
											}
										},
										{
											"time": 0.6972641359979916,
											"value": 1.75,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.72,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.3764705882352941,
											0.7607843137254902,
											1
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "lookAt",
					"name": "lookAt",
					"enabled": false,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"lockAxis": [
						0,
						0,
						0
					],
					"children": [
						{
							"type": "polygon",
							"name": "WhiteFlames",
							"y": -0.01,
							"z": 0.27735,
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
													"time": 0.5919898485973163,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.762122570980946,
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
									"enabled": false,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.3764705882352941,
											0.7607843137254902,
											1
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Glow",
							"x": -1.1102230246251565e-16,
							"z": 2.220446049250313e-16,
							"scaleX": 1.9999999999999996,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationX": -89.99999999999999,
							"rotationY": -9.467383808129004e-16,
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
									"enabled": false,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.3764705882352941,
											0.7607843137254902,
											1
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
									"time": 0.8478217289466716,
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
									"time": 1.111741629639519,
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
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": ".FXRoot.lookAt",
					"target": ".FXRoot.Drisq.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
				}
			]
		}
	]
}