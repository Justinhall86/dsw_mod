{
	"type": "fx",
	"cullingRadius": 30,
	"children": [
		{
			"type": "model",
			"name": "Sandfall",
			"source": "Environment/Asset/Sandfall/Sandfall.fbx",
			"editorOnly": true,
			"x": 0.57711,
			"y": 1.23195,
			"rotationZ": -0.8,
			"children": [
				{
					"type": "shader",
					"name": "SandBlend",
					"source": "shaders/SandBlend.hx",
					"props": {
						"colorMask": "Environment/Asset/Sandfall/Sandfall_Mask_Albedo.png"
					}
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "SandFall",
					"source": "Fx/Meshes_Common/SandFall01.fbx",
					"locked": true,
					"scaleX": 1.02,
					"scaleY": 1.02,
					"scaleZ": 1.02,
					"rotationZ": 35.3,
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
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
										"progress": 0.48,
										"saturation": 1,
										"width": 0.51,
										"uvScaleX": 2,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.02
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
										"progress": 0.47,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Dirt_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.015
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.5,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											3,
											1
										],
										"alpha": 1.5,
										"MULTIPLY": false,
										"color": [
											0.8274509803921568,
											0.7529411764705882,
											0.7058823529411764,
											1
										],
										"mask": "Fx/noise/Smoke10.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 30,
													"value": -1,
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
										"envBlend": 0.8,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 8,
										"texScaleY": 8,
										"tex": "Fx/Gradients/Cyl04v_A.jpg",
										"intensity": 1,
										"scrollSpeed": [
											0.1,
											0
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "SandFall",
					"source": "Fx/Meshes_Common/SandFall01.fbx",
					"enabled": false,
					"locked": true,
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
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 1.5383795776060143,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9848070347707392,
													"value": 0.8,
													"mode": 2
												},
												{
													"time": 3.3652929458031897,
													"value": 0,
													"mode": 2
												},
												{
													"time": 22.611255896009105,
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
										"useScale": true,
										"wrap": true,
										"progress": 0.29,
										"saturation": 0.6,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 4.2030833857683625,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.15154515074241,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.886920826469527,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.942230923310529,
													"value": 0,
													"mode": 2
												},
												{
													"time": 14.971616693925373,
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
											0.6274509803921569,
											0.5647058823529412,
											0.5372549019607843
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.4,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
									},
									"isInstance": true
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
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.25
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
										"progress": 0.47,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Dirt_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.1
										]
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 8,
										"texScaleY": 8,
										"tex": "Fx/Gradients/Cyl04v_A.jpg",
										"intensity": 0.5,
										"scrollSpeed": [
											0.2,
											0
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "FloorSmall",
					"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
					"locked": true,
					"x": -1.81514,
					"y": 0.38521,
					"z": 0.75,
					"scaleX": 29,
					"scaleY": 29,
					"scaleZ": 29,
					"rotationZ": -16.36,
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
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.48,
										"saturation": 0.75,
										"width": 0.54,
										"uvScaleX": 6,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.02
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
										"width": 0.46,
										"uvScaleX": 2,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.025
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.17,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0.15
										],
										"uvShiftSpeed": [
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
														"color": -3223858
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
										"alpha": 1.5
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
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.025
										]
									}
								},
								{
									"type": "shader",
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											5,
											1
										],
										"alpha": 1.5,
										"MULTIPLY": false,
										"color": [
											0.8823529411764706,
											0.8196078431372549,
											0.7803921568627451,
											1
										],
										"mask": "Fx/noise/Smoke10.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 35,
													"value": -1,
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
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.8,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "emitter",
					"name": "SandParticles_circle",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"lifeTimeRand": 0.2,
						"emitSurface": true,
						"instScale": 8,
						"lifeTime": 3.5,
						"emitRad1": 0.64,
						"emitRad2": 0.69,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"emitRate": 25,
						"maxCount": 100,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							-0.14
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"instWorldAcceleration": [
							0,
							0,
							-1.5
						],
						"emitShape": "Cylinder",
						"emitAngle": 360,
						"warmUpTime": 0.5
					},
					"x": -0.66187,
					"y": 0.3544,
					"z": -0.93689,
					"scaleX": 32,
					"scaleY": 32,
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
										"scale": 1.25
									},
									"isInstance": true,
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
													"time": 0.21434934675273806,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.07144978225091268
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.2618835510824206
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
											1,
											0.9921568627450981,
											0.9921568627450981
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ParticleColorRandom",
									"source": "hrt.shader.ParticleColorRandom",
									"props": {
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -3031619
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 1,
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
														"dv": 0.8035692405872087,
														"dt": -0.4659004914333202
													},
													"nextHandle": {
														"dv": -0.8035692405872087,
														"dt": 0.4659004914333202
													}
												},
												{
													"time": 1,
													"value": 0.028356760620360077,
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
										"range": 2,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.2,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.6,
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
									"value": 0.3,
									"mode": 0,
									"prevHandle": {
										"dv": -0.22116023671467114,
										"dt": -0.6123362668115435
									},
									"nextHandle": {
										"dv": 0.22116023671467114,
										"dt": 0.6123362668115435
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.1897734247272047,
										"dt": -0.3839285714285714
									},
									"nextHandle": {
										"dv": 0.1605763119302733,
										"dt": 0.3255871280819176
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
									"time": 0,
									"value": 0,
									"mode": 0
								},
								{
									"time": 1.9955357142857142,
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
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"enabled": false,
							"keyMode": 1,
							"keys": [
								{
									"time": 3.9320274074806383,
									"value": 0,
									"mode": 0
								},
								{
									"time": 5.575983676624022,
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
									"time": 6.964213415011766,
									"value": 0.9833333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0026474846836679242,
										"dt": -0.16666181090700632
									},
									"nextHandle": {
										"dv": -0.016666666666666607,
										"dt": 1.051754150390626
									}
								},
								{
									"time": 10,
									"value": 0,
									"mode": 0,
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
						}
					]
				},
				{
					"type": "object",
					"name": "SandFall_singleMeshes",
					"x": -0.6626350000000001,
					"y": 0.7979949999999999,
					"z": 0.45028833333333323,
					"children": [
						{
							"type": "model",
							"name": "SandFallSingle_large",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": 6.817615,
							"y": 1.240965,
							"z": -0.3930383333333332,
							"scaleX": 2,
							"scaleY": 2,
							"rotationZ": -152.59999999999997,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
											"name": "DissolveMap_gradient",
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
												"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2.5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SandFallSingle",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": 2.592595,
							"y": -0.22579499999999986,
							"z": 0.8042416666666667,
							"scaleX": 0.9999999999999998,
							"rotationX": -2.9,
							"rotationY": 3.9000000000000004,
							"rotationZ": -57.20000000000001,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
											"name": "DissolveMap_gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2.5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SandFallSingle",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": -6.026495,
							"y": -0.07689499999999994,
							"z": -0.4542683333333332,
							"scaleY": 0.9999999999999999,
							"rotationX": -1.9,
							"rotationY": 1.5,
							"rotationZ": 54,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
											"name": "DissolveMap_gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2.5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SandFallSingle",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": 1.078295,
							"y": 0.5570850000000002,
							"z": 0.3098816666666668,
							"rotationX": -4.699999999999999,
							"rotationY": 2.7999999999999994,
							"rotationZ": -9.599999999999998,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
											"name": "DissolveMap_gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 0.9,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
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
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1.5,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SandFallSingle",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": -3.4292750000000005,
							"y": -0.7644149999999998,
							"z": 0.3098816666666668,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"rotationX": -4.7,
							"rotationY": 2.8000000000000016,
							"rotationZ": 133.89999999999998,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
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
											"name": "DissolveMap_gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1.5,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SandFallSingle",
							"source": "Fx/Meshes_Common/SandFall_single.fbx",
							"x": -1.032735,
							"y": -0.730945,
							"z": -0.5766983333333332,
							"rotationX": -4.700000000000001,
							"rotationY": 2.8000000000000007,
							"rotationZ": 31.499999999999993,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Smoke10.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.2
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
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl01v_A.png",
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
											"name": "DissolveMap_gradient",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.788235294117647,
													0.7058823529411764,
													0.6627450980392157
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 2.5,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													2
												],
												"alpha": 1.5,
												"MULTIPLY": false,
												"color": [
													1,
													1,
													1,
													0
												],
												"mask": "Fx/noise/Smoke10.png",
												"UVOffset": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "UVOffset.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 30,
															"value": -1,
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
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": false,
												"Y": true,
												"Z": false,
												"texScaleX": 10,
												"texScaleY": 20,
												"tex": "Fx/Gradients/Cyl05u_A.jpg",
												"intensity": 0.25,
												"scrollSpeed": [
													0,
													-0.5
												]
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