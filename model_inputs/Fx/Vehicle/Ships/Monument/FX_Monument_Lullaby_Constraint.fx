{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
			"rotationZ": -154.54593870801395,
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
					"type": "model",
					"name": "Monument",
					"source": "Vehicle/Ecaz/Monument/Monument.fbx",
					"editorOnly": true,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Monument/Anim_Monument_Run.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Passif",
					"y": 0.23807,
					"z": 0.29431,
					"children": [
						{
							"type": "emitter",
							"name": "Notes",
							"props": {
								"alignMode": "Screen",
								"instScale": 0.45,
								"burstParticleCount": 5,
								"emitShape": "Cylinder",
								"instScale_rand": 0.15,
								"emitAngle": 360,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Music.png",
								"instOrbitSpeed_rand": [
									0.05,
									0,
									0
								],
								"speedFactor": 0.5,
								"instOrbitSpeed": [
									0.15,
									0,
									0
								],
								"simulationSpace": "World",
								"instSpeed": [
									1.5,
									0,
									0
								],
								"instSpeed_rand": [
									0.75,
									0,
									0
								],
								"lifeTime": 1.75,
								"emitRate": 1,
								"instWorldSpeed": [
									0,
									0,
									0.075
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.175
								],
								"instRotation": [
									0,
									0,
									2.5
								],
								"instRotation_rand": [
									0,
									0,
									-5
								],
								"instAcceleration": [
									0,
									0,
									-1.2
								],
								"instAcceleration_rand": [
									0,
									0,
									-0.2
								]
							},
							"z": -0.12162,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 1.5,
							"rotationX": 90,
							"rotationY": 90,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"drawOrder": "120",
													"emissive": 1
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
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.10476190476190476,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.024291647063283572,
																"dt": -0.4963235294117647
															},
															"nextHandle": {
																"dv": 0.024291647063283572,
																"dt": 0.4963235294117647
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
													0.00784313725490196,
													0.12549019607843137,
													0.5568627450980392
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 3.2265005631462738,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01804863695746972,
																"dt": -0.14732142857142855
															},
															"nextHandle": {
																"dv": -0.04082846060276429,
																"dt": 0.33326101890937065
															}
														},
														{
															"time": 0.8442179558095838,
															"value": 3.9643907295299767,
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
															"time": 0,
															"value": 0.596774193548387,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0010666137178234614,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.0022753519050003152,
																"dt": 0.3333200475630523
															}
														},
														{
															"time": 0.8442179558095838,
															"value": 0.9722222222222223,
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
															"time": 0,
															"value": 0.7568627450980392,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0013480392156863807,
																"dt": -0.1875
															},
															"nextHandle": {
																"dv": 0.0023964478276402214,
																"dt": 0.33332410693542613
															}
														},
														{
															"time": 0.8442179558095838,
															"value": 0.2823529411764706,
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
									"name": "emitRate",
									"keys": [
										{
											"time": 1.532634403004366,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6815232918932548,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
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
											"mode": 0,
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
							"type": "object",
							"name": "Trail",
							"x": -0.16571,
							"children": [
								{
									"type": "trails",
									"name": "Trails",
									"x": 5.551115123125783e-17,
									"y": 8.881784197001252e-16,
									"z": 1.1102230246251565e-16,
									"scaleY": 1.0000000000000002,
									"rotationY": -2.426570649309934e-20,
									"startWidth": 4,
									"endWidth": 3,
									"lifetime": 16,
									"minSpeed": 1.25,
									"maxSpeed": 100,
									"uvMode": "ELifetime",
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
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 0.4,
												"uOffset": 1,
												"vOffset": 0.3,
												"texture": "Fx/Alphas/T_Music_Partition_05.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3602941176470589,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.018382701166021222,
																"dt": -0.49996913865997117
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.4532295245907001
															}
														},
														{
															"time": 2.402472856560643,
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
													0.6666666666666666,
													1,
													0.7686274509803921
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
												"progress": 0.28,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.75,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.25,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -8144688
															},
															{
																"position": 0.4921875,
																"color": -2884726
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
																"color": -83746674
															},
															{
																"position": 0.5,
																"color": -8140080
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
									"type": "trails",
									"name": "TrailsPartition",
									"x": 5.551115123125783e-17,
									"y": 8.881784197001252e-16,
									"z": 1.1102230246251565e-16,
									"scaleY": 1.0000000000000002,
									"rotationY": -2.426570649309934e-20,
									"startWidth": 4,
									"endWidth": 3,
									"lifetime": 16,
									"minSpeed": 1.25,
									"maxSpeed": 100,
									"uvMode": "ELifetime",
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
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
												"vScale": 0.4,
												"uOffset": 1,
												"vOffset": 0.3,
												"texture": "Fx/Alphas/T_Music_Partition_01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.6823019034632045,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.018382701166021222,
																"dt": -0.49996913865997117
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.4532295245907001
															}
														},
														{
															"time": 2.402472856560643,
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
													0.8509803921568627,
													1,
													0.5176470588235293
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
												"progress": 0.28,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.85,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.25,
												"shiftSpeedY": 0
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
																"color": -83746674
															},
															{
																"position": 0.39453125,
																"color": -8140080
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
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													2.5,
													1
												],
												"alpha": 1.5,
												"MULTIPLY": false,
												"color": [
													1,
													0.27450980392156865,
													0.44705882352941173,
													1
												],
												"mask": "Fx/noise/T_Noise_Water_04.png",
												"UVOffset": [
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
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Passif",
					"target": "FXAnimation.FXRoot.Monument.root.B_ROOT.B_LIGHT"
				}
			]
		}
	]
}