{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 50,
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
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "WensiciaTiger",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Tiger_ImperialLazaTiger",
							"source": "Character/Imperial/LazaTiger/Tiger_ImperialLazaTiger.fbx",
							"rotationZ": 95,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Tiger/Anim_Tiger_AttackMelee01.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "SlashL",
					"x": 0.93715,
					"y": 0.10424,
					"z": 1.20065,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 41.1,
					"rotationY": 15.3,
					"rotationZ": 13.6,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"scaleX": 3.5,
							"scaleY": 3.5000000000000004,
							"scaleZ": 3.5000000000000004,
							"rotationX": 13.1,
							"rotationY": 2,
							"rotationZ": 31.4,
							"kind": 1,
							"args": [
								24,
								225,
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
									"enabled": false,
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
													"time": 0.1567602605489134,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6761352605489075,
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
													"time": 0.19865403838007772,
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
													"time": 0.6325291644787787,
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
													"time": 1.0613567695529633,
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
													"time": 0.5908529664345881,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6008529664345881,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6169562575540208,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6269562575540208,
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
								225,
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
											"emissive": 1
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
													"time": 0.6169265561301192,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6269265561301192,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6369265561301192,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.6917602605489133,
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
									"enabled": false,
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
													"time": 0.1464366319640898,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.6658116319640839,
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
													"time": 0.19865403838007772,
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
													"time": 0.6325291644787787,
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
													"time": 1.0745394491918303,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.8352941176470589,
											0.6235294117647059
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 2.40176,
					"y": 0.47302,
					"z": 0.44023,
					"scaleX": 1.25,
					"scaleY": 0.74,
					"scaleZ": 0.18,
					"rotationX": 40.1,
					"rotationY": -43.1,
					"rotationZ": 74.3,
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
									"emissive": 5
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
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5636870415584907,
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
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6237572350158672,
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
											"time": 0.6927650003064073,
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
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.7814958956889254,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.8465734322418719,
											"value": 0.2,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5257479720064635,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -5.1929172557584735,
										"dt": -0.27727380087695946
									},
									"nextHandle": {
										"dv": 4.550322954356672,
										"dt": 0.24499999999999988
									}
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0031479305361366,
									"value": 5,
									"mode": 2
								}
							]
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
						}
					]
				},
				{
					"type": "object",
					"name": "Step2",
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor2",
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
								"instScale": 8,
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
								"warmUpTime": -0.55,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.5,
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
									6,
									0,
									0
								]
							},
							"x": 0.3046,
							"y": -0.39623,
							"z": 0.26608,
							"scaleX": 0.9999999999999997,
							"scaleY": 0.9999999999999997,
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
								}
							]
						},
						{
							"type": "polygon",
							"name": "Back_Sand_Stylised2",
							"enabled": false,
							"x": 7.5,
							"y": -0.3,
							"z": 0.3,
							"scaleX": 7.697008209504853,
							"scaleY": 8.553300372812268,
							"scaleZ": 0.09621260261881065,
							"rotationX": -11.999999999999995,
							"rotationZ": 90.00000000000001,
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
													"time": 0.3165787488652175,
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
													"time": 1.2025053074950667,
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
											"time": 0.45273455433801124,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8522417266663251,
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
											"time": 0.4769967385356858,
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
											"time": 1.6625098580407145,
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
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"x": 1.05704,
							"y": -0.20379,
							"z": 0.12,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 0.05,
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
													"time": 0.5289434107544644,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 0.5289434107544644,
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
													"time": 1.3551455565567463,
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
											"time": 0.5804808480663903,
											"value": 0,
											"mode": 0,
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
											"time": 0.6147549315567461,
											"value": 0.4,
											"mode": 0,
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
											"time": 1.48372954093175,
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
					"type": "model",
					"name": "Knees",
					"source": "Fx/Meshes_Common/PlanePivBot_MoreVrtx.fbx",
					"x": 0.85004,
					"y": 1.37007,
					"z": 2.3684,
					"scaleX": 52.5,
					"scaleY": 70,
					"scaleZ": 150,
					"rotationX": 37.9,
					"rotationY": 177,
					"rotationZ": 22.6,
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
								"alpha": 2.27,
								"uScale": 1,
								"vScale": 1.4,
								"uOffset": -0.18,
								"vOffset": -0.14,
								"texture": "Fx/Alphas/T_Claws.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.07901301043185005,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5544253098237621,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6082447019077498,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.7430692145925879,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "uOffset",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5464221241456987,
											"value": 2.5,
											"mode": 0,
											"prevHandle": {
												"dv": 4.082155997157844e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07999999999999996
											}
										},
										{
											"time": 0.7105673494960093,
											"value": -3,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10833333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.10833333333333332
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
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.08,
								"vOffset": 0,
								"texture": "Fx/Gradients/uGrad.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.07901301043185005,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5544253098237621,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6082447019077498,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.7430692145925879,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.041899793662877126
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
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
									0.9921568627450981,
									0.8235294117647058,
									0.6627450980392157
								]
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
								"progress": 0.52,
								"saturation": 1,
								"width": 0.15,
								"uvScaleX": 0.14,
								"uvScaleY": 0.73,
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
											"time": 0.45781604443062485,
											"value": 0.05111111111111105,
											"mode": 0,
											"prevHandle": {
												"dv": 4.082155997157844e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07999999999999996
											}
										},
										{
											"time": 0.6365388657289123,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10833333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.10833333333333332
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
								"progress": 0.33,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 0.98,
								"uvScaleY": 1,
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
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScaleX": 1,
								"texScaleY": 1,
								"tex": {
									"type": "gradient",
									"data": {
										"stops": [
											{
												"position": 0,
												"color": -16777216
											},
											{
												"position": 0.21875,
												"color": -3026479
											},
											{
												"position": 0.47265625,
												"color": -1
											},
											{
												"position": 0.734375,
												"color": 13750737
											},
											{
												"position": 1,
												"color": -16777216
											}
										],
										"resolution": 64,
										"isVertical": false,
										"interpolation": "Linear",
										"colorMode": 0
									}
								},
								"intensity": 2,
								"scrollSpeed": [
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