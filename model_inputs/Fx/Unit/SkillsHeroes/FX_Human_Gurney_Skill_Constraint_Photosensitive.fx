{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 200,
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
			"name": "Gurney",
			"editorOnly": true,
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreidesGurney",
					"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.9999999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_Run.fbx",
							"loop": true
						}
					]
				},
				{
					"type": "model",
					"name": "GurneySet_Shield",
					"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"rotationX": -90
				},
				{
					"type": "model",
					"name": "GurneySet_Javelin",
					"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
					"x": 0.04935,
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"rotationX": -90
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Gurney.GurneySet_Shield",
					"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Gurney.GurneySet_Javelin",
					"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Passif",
					"y": 0.1,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "emitter",
							"name": "Notes",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale": 0.5,
								"burstParticleCount": 5,
								"maxCount": 30,
								"emitShape": "Cylinder",
								"instScale_rand": 0.2,
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
									0.2,
									0,
									0
								],
								"simulationSpace": "World",
								"instSpeed": [
									2,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"lifeTime": 1.25,
								"emitRate": 4,
								"instWorldSpeed": [
									0,
									0,
									0.1
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.2
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
													"blend": "Alpha",
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
													0.7686274509803921,
													1,
													0.7450980392156863
												]
											}
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
							"type": "trails",
							"name": "TrailsPartition",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3,
							"endWidth": 2,
							"lifetime": 3.5,
							"minSpeed": 1,
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
											"colorMask": 255
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
										"alpha": 0.5,
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
										"shiftSpeedX": -0.45,
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
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"enabled": false,
									"props": {
										"UVScale": [
											4,
											4
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											1,
											1,
											1,
											1
										],
										"mask": "Fx/noise/T_Fire.png",
										"UVOffset": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "trails",
							"name": "Trails",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3,
							"endWidth": 2,
							"lifetime": 3.5,
							"minSpeed": 1,
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
											"colorMask": 255
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
										"alpha": 0.15,
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
										"shiftSpeedX": -0.45,
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
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Gurney.Male01_AtreidesGurney.root.B_ROOTJ"
		}
	]
}