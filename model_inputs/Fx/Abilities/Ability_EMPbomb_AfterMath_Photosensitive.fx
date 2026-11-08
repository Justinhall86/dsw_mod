{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 1000,
			"scaleY": 1000,
			"scaleZ": 1000,
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
			"z": 1,
			"children": [
				{
					"type": "curve",
					"name": "visibility",
					"keys": [
						{
							"time": 0.00019368289128784966,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.010193682891287636,
							"value": 1,
							"mode": 2
						}
					]
				},
				{
					"type": "object",
					"name": "ElectricArcs",
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_ElectricityLight",
							"enabled": false,
							"locked": true,
							"z": -3.1955866666666664,
							"scaleX": 500,
							"scaleY": 500,
							"scaleZ": 270,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 1.64,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.25,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/circGrad01.png",
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
											"loop": true,
											"keys": [
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.37165642782292463,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.3867115728195106,
													"value": 0.4084418650739862,
													"mode": 2
												},
												{
													"time": 0.40176671781609646,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.4893602887053235,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.54392386679814,
													"value": 1.1810256932752077,
													"mode": 2
												},
												{
													"time": 0.6177901609228753,
													"value": -0.013847784704668062,
													"mode": 2
												},
												{
													"time": 0.7483176179862611,
													"value": 0.9937371701842155,
													"mode": 2
												},
												{
													"time": 0.8513590958579583,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 1.9967903584565798,
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
											0.6627450980392157,
											0.6627450980392157,
											1
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Thunder_SandStorm",
							"props": {
								"instScale_rand": 7,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									0.8117647058823529,
									0.8705882352941177,
									1
								],
								"randomColor2": [
									0.6941176470588235,
									0.9686274509803922,
									1,
									1
								],
								"emitAngle": 0,
								"emitRate": 2,
								"enableSort": false,
								"instRotation_rand": [
									0,
									50,
									0
								],
								"instScale": 12,
								"lifeTimeRand": 0.1,
								"emitRad1": 0.52,
								"frameCount": 4,
								"seedGroup": 5,
								"tag": null,
								"instStretch_rand": [
									1,
									0.2,
									0
								],
								"emitType": "BurstDuration",
								"emitRateMin": 10,
								"emitRateMax": 12,
								"emitRateChangeDelay": 0.2,
								"emitDuration": 500,
								"lifeTime": 1.5,
								"alignMode": "Screen",
								"useRandomColor": true,
								"instStretch": [
									1.5,
									1,
									1
								],
								"instOffset": [
									0,
									-2,
									0
								],
								"frameDivisionX": 8
							},
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										6
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
													"drawOrder": "120",
													"emissive": 10
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/Cyl05v_A01.png",
											"color": [
												1,
												1,
												1,
												0.8392156862745098
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/vGrad.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
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
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0.01
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
															"value": -0.020245897474978403,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8867282900325055,
																"dt": -0.11018606649438058
															},
															"nextHandle": {
																"dv": 0.5202458974749784,
																"dt": 0.06365623589139441
															}
														},
														{
															"time": 0.1935490769101309,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0591041572609296
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4408958427390704
															}
														},
														{
															"time": 0.8267766768764712,
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
												"range": 5,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleFade",
											"source": "hrt.shader.ParticleFade",
											"props": {
												"fadeInLife": 0.1,
												"fadeOutLife": 0.36,
												"power": 1
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
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
												"uvShift": [
													1,
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
													"name": "uvShift.x",
													"keys": [
														{
															"time": 0.4630102040816326,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47301020408163263,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5461224489795918,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5561224489795918,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5661224489795919,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.6186224489795918,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.625,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7087151556348436,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7187151556348436,
															"value": 0.5,
															"mode": 2
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
												"noiseTexture": "Fx/Gradients/ShieldMask.png",
												"directionalNoise": true,
												"intensity": 0.04,
												"scrollSpeed": [
													0.5,
													0
												],
												"scale": [
													2,
													2
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
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl05v_A.png",
												"intensity": 1,
												"scrollSpeed": [
													1,
													0
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
											0.6627450980392157,
											0.6627450980392157,
											1
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Thunder_SandStorm",
							"props": {
								"instScale_rand": 8,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									0.8117647058823529,
									0.8705882352941177,
									1
								],
								"randomColor2": [
									0.6941176470588235,
									0.9686274509803922,
									1,
									1
								],
								"emitAngle": 0,
								"emitRate": 2,
								"enableSort": false,
								"instRotation_rand": [
									0,
									50,
									0
								],
								"instScale": 15,
								"lifeTimeRand": 0.1,
								"emitRad1": 0.52,
								"frameCount": 4,
								"seedGroup": 4,
								"tag": null,
								"instStretch_rand": [
									1,
									0.2,
									0
								],
								"emitType": "BurstDuration",
								"emitRateMin": 10,
								"emitRateMax": 12,
								"emitRateChangeDelay": 0.2,
								"emitDuration": 500,
								"lifeTime": 1.5,
								"alignMode": "Screen",
								"useRandomColor": true,
								"instStretch": [
									1.5,
									1,
									1
								],
								"instOffset": [
									0,
									-2,
									0
								],
								"frameDivisionX": 8
							},
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										6
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
													"drawOrder": "120",
													"emissive": 10
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/Cyl05v_A01.png",
											"color": [
												1,
												1,
												1,
												0.8392156862745098
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/vGrad.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
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
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0.01
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
															"value": -0.020245897474978403,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8867282900325055,
																"dt": -0.11018606649438058
															},
															"nextHandle": {
																"dv": 0.5202458974749784,
																"dt": 0.06365623589139441
															}
														},
														{
															"time": 0.1935490769101309,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0591041572609296
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4408958427390704
															}
														},
														{
															"time": 0.8267766768764712,
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
												"range": 5,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleFade",
											"source": "hrt.shader.ParticleFade",
											"props": {
												"fadeInLife": 0.1,
												"fadeOutLife": 0.36,
												"power": 1
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
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
												"uvShift": [
													1,
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
													"name": "uvShift.x",
													"keys": [
														{
															"time": 0.4630102040816326,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.47301020408163263,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.5461224489795918,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.5561224489795918,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.5661224489795919,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.6186224489795918,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.625,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710049835777282,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.720049835777282,
															"value": 0.5,
															"mode": 2
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
												"noiseTexture": "Fx/Gradients/ShieldMask.png",
												"directionalNoise": true,
												"intensity": 0.04,
												"scrollSpeed": [
													0.5,
													0
												],
												"scale": [
													2,
													2
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
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl05v_A.png",
												"intensity": 1,
												"scrollSpeed": [
													1,
													0
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
											0.6627450980392157,
											0.6627450980392157,
											1
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Thunder_Floor",
							"enabled": false,
							"props": {
								"instScale_rand": 16,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									0.8117647058823529,
									0.8705882352941177,
									1
								],
								"randomColor2": [
									0.6941176470588235,
									0.9686274509803922,
									1,
									1
								],
								"emitAngle": 0,
								"emitRate": 2,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 100,
								"lifeTimeRand": 0.1,
								"emitRad1": 0.52,
								"frameCount": 4,
								"frameDivisionY": 4,
								"seedGroup": 5,
								"tag": null,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitType": "BurstDuration",
								"emitRateMin": 10,
								"emitRateMax": 12,
								"emitRateChangeDelay": 0.2,
								"emitDuration": 500,
								"burstParticleCount": 2,
								"lifeTime": 1.5,
								"useRandomColor": true
							},
							"scaleX": 75,
							"scaleY": 75,
							"scaleZ": 0.08,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"drawOrder": "120"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.8392156862745098
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
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
																"dv": -0.8867282900325055,
																"dt": -0.11018606649438058
															},
															"nextHandle": {
																"dv": 0.5202458974749784,
																"dt": 0.06365623589139441
															}
														},
														{
															"time": 0.1935490769101309,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0591041572609296
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4408958427390704
															}
														},
														{
															"time": 0.8267766768764712,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ParticleFade",
											"source": "hrt.shader.ParticleFade",
											"props": {
												"fadeInLife": 0.1,
												"fadeOutLife": 0.36,
												"power": 1
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
											0.7333333333333333,
											0.7333333333333333,
											0.9882352941176471
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Thunder_SandStorm",
							"props": {
								"instScale_rand": 9,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									0.8117647058823529,
									0.8705882352941177,
									1
								],
								"randomColor2": [
									0.6941176470588235,
									0.9686274509803922,
									1,
									1
								],
								"emitAngle": 0,
								"emitRate": 2,
								"enableSort": false,
								"instRotation_rand": [
									0,
									50,
									0
								],
								"instScale": 12,
								"lifeTimeRand": 0.1,
								"emitRad1": 0.52,
								"frameCount": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_09.png",
								"seedGroup": 6,
								"tag": null,
								"instStretch_rand": [
									0.5,
									0.2,
									0
								],
								"emitType": "BurstDuration",
								"emitRateMin": 10,
								"emitRateMax": 12,
								"emitRateChangeDelay": 0.2,
								"emitDuration": 500,
								"lifeTime": 1.5,
								"alignMode": "Screen",
								"useRandomColor": true,
								"instStretch": [
									1.75,
									1,
									1
								],
								"warmUpTime": -0.3
							},
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 0,
									"args": [
										6
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
													"drawOrder": "120",
													"emissive": 10
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/Cyl05v_A01.png",
											"color": [
												1,
												1,
												1,
												0.8392156862745098
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/vGrad.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
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
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													0.01
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
															"value": -0.020245897474978403,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8867282900325055,
																"dt": -0.11018606649438058
															},
															"nextHandle": {
																"dv": 0.5202458974749784,
																"dt": 0.06365623589139441
															}
														},
														{
															"time": 0.1935490769101309,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0591041572609296
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4408958427390704
															}
														},
														{
															"time": 0.8267766768764712,
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
												"range": 5,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleFade",
											"source": "hrt.shader.ParticleFade",
											"props": {
												"fadeInLife": 0.1,
												"fadeOutLife": 0.36,
												"power": 1
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
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
												"uvShift": [
													1,
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
													"name": "uvShift.x",
													"keys": [
														{
															"time": 0.4630102040816326,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.47301020408163263,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.5461224489795918,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.5561224489795918,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.5661224489795919,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6186224489795918,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.625,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.710049835777282,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.720049835777282,
															"value": 0,
															"mode": 2
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
												"noiseTexture": "Fx/Gradients/ShieldMask.png",
												"directionalNoise": true,
												"intensity": 0.04,
												"scrollSpeed": [
													0.5,
													0
												],
												"scale": [
													2,
													2
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
												"texScaleX": 5,
												"texScaleY": 1,
												"tex": "Fx/Gradients/Cyl05v_A.png",
												"intensity": 1,
												"scrollSpeed": [
													1,
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
							"name": "Thunder_Floor",
							"enabled": false,
							"props": {
								"instScale_rand": 18,
								"maxCount": 100,
								"simulationSpace": "World",
								"animationSpeed": 0.2,
								"randomColor1": [
									1,
									0.8117647058823529,
									0.8705882352941177,
									1
								],
								"randomColor2": [
									0.6941176470588235,
									0.9686274509803922,
									1,
									1
								],
								"emitAngle": 0,
								"emitRate": 2,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 90,
								"lifeTimeRand": 0.1,
								"emitRad1": 0.52,
								"frameCount": 4,
								"frameDivisionY": 4,
								"seedGroup": 6,
								"tag": null,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitType": "BurstDuration",
								"emitRateMin": 10,
								"emitRateMax": 12,
								"emitRateChangeDelay": 0.2,
								"emitDuration": 500,
								"lifeTime": 1.5,
								"useRandomColor": true,
								"warmUpTime": -0.3
							},
							"scaleX": 75,
							"scaleY": 75,
							"scaleZ": 0.11,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"drawOrder": "120"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.8392156862745098
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.009682033920758618,
															"mode": 2
														},
														{
															"time": 0.37565000853983777,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.3907051535364237,
															"value": 0.4336580807516465,
															"mode": 2
														},
														{
															"time": 0.4057602985330096,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.49335386942223663,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.5191059486354324,
															"value": 1.2062419089528693,
															"mode": 2
														},
														{
															"time": 0.5508371503182918,
															"value": 0.011368430972990232,
															"mode": 2
														},
														{
															"time": 0.5918966366726169,
															"value": 1.0189533858618764,
															"mode": 2
														},
														{
															"time": 0.6220069266657888,
															"value": 0.026744497787944133,
															"mode": 2
														},
														{
															"time": 0.9641693129518321,
															"value": 1.1491176597787687,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
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
																"dv": -0.8867282900325055,
																"dt": -0.11018606649438058
															},
															"nextHandle": {
																"dv": 0.5202458974749784,
																"dt": 0.06365623589139441
															}
														},
														{
															"time": 0.1935490769101309,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0591041572609296
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4408958427390704
															}
														},
														{
															"time": 0.8267766768764712,
															"value": 0.5,
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
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleFade",
											"source": "hrt.shader.ParticleFade",
											"props": {
												"fadeInLife": 0.1,
												"fadeOutLife": 0.36,
												"power": 1
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
											0.7333333333333333,
											0.7333333333333333,
											0.9882352941176471
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Electricity",
							"enabled": false,
							"locked": true,
							"z": -3.1955866666666664,
							"scaleX": 175,
							"scaleY": 175,
							"scaleZ": 94.5,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"fadePower": 1.64,
							"emissive": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.48,
										"saturation": 1,
										"width": 0.49,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.25
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 0.49,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/noise/T_ElecNoise01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.1,
											0.3
										]
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
										"progress": 0.25,
										"saturation": 1,
										"width": 0.26,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.2,
											0.1
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
														"color": -11261006
													},
													{
														"position": 0.77734375,
														"color": -2555907
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
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.37165642782292463,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.3867115728195106,
													"value": 0.4084418650739862,
													"mode": 2
												},
												{
													"time": 0.40176671781609646,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.4893602887053235,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 0.54392386679814,
													"value": 1.1810256932752077,
													"mode": 2
												},
												{
													"time": 0.6177901609228753,
													"value": -0.013847784704668062,
													"mode": 2
												},
												{
													"time": 0.7483176179862611,
													"value": 0.9937371701842155,
													"mode": 2
												},
												{
													"time": 0.8513590958579583,
													"value": 0.0015282821102857863,
													"mode": 2
												},
												{
													"time": 1.9967903584565798,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.07,
										"useRGB": false
									}
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Sand",
					"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
					"z": 1,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
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
										"alpha": 0.25,
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.1
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
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
										"range": 3,
										"power": 0.8
									}
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "ContratsFloor",
					"enabled": false,
					"scaleX": 1000,
					"scaleY": 1000,
					"scaleZ": 100,
					"albedoMap": "Fx/Gradients/circGrad02.jpg",
					"fadePower": 2,
					"fadeStart": 1,
					"fadeEnd": 2,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.047058823529411764,
									0.03137254901960784,
									0.08235294117647059
								]
							}
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
				}
			]
		}
	]
}