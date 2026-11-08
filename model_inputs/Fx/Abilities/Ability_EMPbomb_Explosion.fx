{
	"type": "fx",
	"duration": 7,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": -0.5,
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
			"scaleX": 0.6,
			"scaleY": 0.6,
			"scaleZ": 0.6,
			"children": [
				{
					"type": "shader",
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"props": {
						"REVERSE": false,
						"range": 1.5,
						"power": 0.8
					}
				},
				{
					"type": "object",
					"name": "Floor",
					"z": 2,
					"scaleX": 1.45,
					"scaleY": 1.45,
					"scaleZ": 1.45,
					"children": [
						{
							"type": "model",
							"name": "Elec02",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"scaleX": 250,
							"scaleY": 250,
							"scaleZ": 250,
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
											"emissive": 3
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
										"progress": 0.22,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.25,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/causticTexture_02.png",
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
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.2,
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
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.8,
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
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"props": {
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.9017386631089813
											},
											"nextHandle": {
												"dv": -5.262223968825359e-16,
												"dt": 0.33333337795849743
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Elec01",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"scaleX": 250,
							"scaleY": 250,
							"scaleZ": 250,
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
											"emissive": 3
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
										"progress": 0.2,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 3,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -1.5,
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
										},
										{
											"type": "curve",
											"name": "uvShift.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -0.2,
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
														"color": -16497480
													},
													{
														"position": 1,
														"color": -11796593
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.8,
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
									"type": "shader",
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.9882352941176471,
											0.7215686274509804,
											0.7215686274509804,
											1
										],
										"mask": "Fx/Alphas/T_ElectricArc_1x4_06.png",
										"UVOffset": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "UVOffset.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.00510204081632653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1,
													"value": -0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2114895579596871,
														"dt": -0.24046024932459553
													},
													"nextHandle": {
														"dv": -0.2114895579596871,
														"dt": 0.24046024932459553
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "UVOffset.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.00510204081632653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.012729939792370531,
														"dt": -0.4997277490954342
													},
													"nextHandle": {
														"dv": 0.012729939792370531,
														"dt": 0.4997277490954342
													}
												},
												{
													"time": 1,
													"value": -0.1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11272993979237053,
														"dt": -0.2373701018182972
													},
													"nextHandle": {
														"dv": -0.11615584673418546,
														"dt": 0.24369115451363124
													}
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
										"threshold": 0.02,
										"useRGB": false
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.100087368767569,
												"dt": -0.14429308231613439
											},
											"nextHandle": {
												"dv": 1,
												"dt": 0.046544843790482515
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.9017386631089813
											},
											"nextHandle": {
												"dv": -5.262223968825359e-16,
												"dt": 0.33333337795849743
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Distort",
							"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
							"z": 4.440892098500626e-16,
							"scaleX": 500,
							"scaleY": 500,
							"scaleZ": 500,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
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
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.621153878782194,
														"dt": -0.2638029215363347
													},
													"nextHandle": {
														"dv": -0.6006642925019023,
														"dt": 0.2551010315434577
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1780383365763439,
														"dt": -0.2244928641078885
													},
													"nextHandle": {
														"dv": -0.1780383365763439,
														"dt": 0.2244928641078885
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
										"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
										"intensity": 0.008
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 5.103123290706821e-16,
														"dt": -0.26511369565981946
													},
													"nextHandle": {
														"dv": -5.103123290706821e-16,
														"dt": 0.26511369565981946
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.7884382817024209,
														"dt": -0.1945077643364994
													},
													"nextHandle": {
														"dv": -0.8968346079007454,
														"dt": 0.22001651997211888
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
										"scaleX": 1.5,
										"scaleY": 0.1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
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
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.41666666666666663,
														"dt": -0.3299319727891157
													},
													"nextHandle": {
														"dv": 0.4076409317911878,
														"dt": 0.3227850643571037
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
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9766249433119758,
												"dt": -0.44452532726087984
											},
											"nextHandle": {
												"dv": 0.5272562299874135,
												"dt": 0.23972617192642579
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.019410109490492156,
												"dt": -0.4824094015224898
											},
											"nextHandle": {
												"dv": -0.012930935386583117,
												"dt": 0.3333280582004723
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
					"name": "flare",
					"z": 5,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "FlareHorrizontal",
							"props": {
								"lifeTime": 0.2,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 15,
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
								"warmUpTime": -0.05,
								"emitType": "Burst"
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
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 10,
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
												"alpha": 0.6,
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
															"mode": 0,
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
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0
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
													0.6431372549019607,
													0.8627450980392157,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.015,
												"useRGB": false
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.7694276314407384,
												"dt": -0.42994199702196584
											},
											"nextHandle": {
												"dv": 0.48392460849279506,
												"dt": 0.27040816326530615
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
							"name": "Flarecenter",
							"props": {
								"lifeTime": 0.1,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 150,
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
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"warmUpTime": -0.05,
								"emitType": "Burst"
							},
							"z": -2,
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
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100",
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/T_Irridescent.png"
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare02.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.2,
												"color": [
													1,
													0.9098039215686274,
													0.996078431372549
												]
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
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.01,
												"useRGB": false
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
					"name": "Flash",
					"children": [
						{
							"type": "advancedDecal",
							"name": "FlashSmall",
							"scaleX": 350,
							"scaleY": 350,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 2,
							"fadeStart": 1,
							"fadeEnd": 2,
							"renderMode": "AfterTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": -0.11268055555555556,
													"mode": 1,
													"prevHandle": {
														"dv": -0.04156617094541062,
														"dt": -0.11922045032039578
													},
													"nextHandle": {
														"dv": -0.004418592602338817,
														"dt": 0.07265529819588232
													}
												},
												{
													"time": 0.0895217067056407,
													"value": 0.8579819444444443,
													"mode": 0,
													"prevHandle": {
														"dv": 4.079225330621559e-17,
														"dt": -0.05762613271233638
													},
													"nextHandle": {
														"dv": -4.079225330621559e-17,
														"dt": 0.05762613271233638
													}
												},
												{
													"time": 0.7589883829391277,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.023464007015963004,
														"dt": -0.08822429066642856
													},
													"nextHandle": {
														"dv": 0.023464007015963004,
														"dt": 0.08822429066642856
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
											0.996078431372549,
											0.8549019607843137,
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
					"name": "SandShockWave",
					"scaleX": 3.25,
					"scaleY": 3.25,
					"scaleZ": 3.25,
					"children": [
						{
							"type": "emitter",
							"name": "Impact_Burst_Mid_SandJet_L",
							"enabled": false,
							"props": {
								"instScale_rand": 3.5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 9,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitAngle": 180,
								"instRotation": [
									0,
									0,
									-30
								],
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 3,
								"instSpeed": [
									2,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 45,
							"scaleY": 45,
							"scaleZ": 0.23,
							"rotationZ": -90,
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
												"scale": 0.7
											},
											"isInstance": true,
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
															"time": 0.15,
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
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.7,
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
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.15,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Mid_SandJet_R",
							"enabled": false,
							"props": {
								"instScale_rand": 3.5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 9,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitAngle": 180,
								"instRotation": [
									0,
									0,
									30
								],
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 2,
								"instSpeed": [
									2,
									0,
									0
								],
								"emitRad2": 0.9,
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 45,
							"scaleY": 45,
							"scaleZ": 0.23,
							"rotationZ": 90,
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
												"scale": 0.7
											},
											"isInstance": true,
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
															"time": 0.15,
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
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.7,
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
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.15,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_R",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 10,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									0.5,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"emitType": "Burst",
								"burstParticleCount": 18,
								"emitAngle": 180,
								"instRotation": [
									0,
									0,
									30
								],
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 5,
								"instSpeed": [
									3,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 0.23,
							"rotationZ": 90,
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
												"scale": 0.7
											},
											"isInstance": true,
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
															"time": 0.15,
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
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.7,
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
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.15,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Impact_Burst_Far_SandJet_L",
							"props": {
								"instScale_rand": 4,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									15
								],
								"lifeTimeRand": 3,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"emitOrientation": "Normal",
								"instScale": 10,
								"lifeTime": 4,
								"emitRad1": 0.8,
								"randomColor2": [
									0.8431372549019608,
									0.7607843137254902,
									0.7254901960784313,
									1
								],
								"instSpeed_rand": [
									0.5,
									0,
									0
								],
								"emitRate": 20,
								"maxCount": 100,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch_rand": [
									0,
									0.25,
									0
								],
								"instStretch": [
									1,
									2,
									1
								],
								"emitType": "Burst",
								"burstParticleCount": 18,
								"emitAngle": 180,
								"instRotation": [
									0,
									0,
									-30
								],
								"emitDuration": 20,
								"burstDelay": 1.35,
								"seedGroup": 4,
								"instSpeed": [
									3,
									0,
									0
								],
								"useRandomColor": true
							},
							"x": -0.7514,
							"z": -0.32935,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 0.23,
							"rotationZ": -90,
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
												"scale": 0.7
											},
											"isInstance": true,
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
															"time": 0.15,
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
													1,
													1,
													1
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
												"useScale": true,
												"wrap": true,
												"progress": 0.58,
												"saturation": 0,
												"width": 0.7,
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
																"dv": 1.1946815774171073,
																"dt": -0.37422467067608545
															},
															"nextHandle": {
																"dv": -1.0693652343750002,
																"dt": 0.3379705070727756
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.15,
											"topSpan": 0.3,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
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
											"value": -0.004801283442754212,
											"mode": 0,
											"prevHandle": {
												"dv": -1.388476860780481,
												"dt": -0.06199247660355442
											},
											"nextHandle": {
												"dv": 0.7972549709272361,
												"dt": 0.03559570312500002
											}
										},
										{
											"time": 1,
											"value": 1.0582053444602273,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.92880859375
											},
											"nextHandle": {
												"dv": -2.5729900539317147e-16,
												"dt": 0.42212406308208533
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
								"range": 4,
								"power": 0.8
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort_Chockwave",
					"props": {
						"instScale_rand": 0,
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
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 1.8,
						"alignMode": "Screen",
						"instOffset": [
							0,
							0,
							25
						]
					},
					"z": 14.644566666666666,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.05,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/DiskFlat.fbx",
							"scaleX": 200,
							"scaleY": 200,
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
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "-100",
											"emissive": 2.2
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/water-normal.png",
										"intensity": 0.05
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
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
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
										"scaleX": 2,
										"scaleY": 2,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
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
										"progress": 0.7,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
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
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
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
									"time": 0.0049999999999999975,
									"value": 0.0402048299726524,
									"mode": 0,
									"prevHandle": {
										"dv": -0.9239350146379692,
										"dt": -0.3456633226416698
									},
									"nextHandle": {
										"dv": 0.12028199966650588,
										"dt": 0.045000000000000005
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.026729333259223442,
										"dt": -0.865
									},
									"nextHandle": {
										"dv": 0.0103433736750329,
										"dt": 0.33472657705803693
									}
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"editorOnly": true,
					"keyMode": 1,
					"keys": [
						{
							"time": 0.04857482467833574,
							"value": 0,
							"mode": 2
						},
						{
							"time": 0.058574824678335746,
							"value": 1,
							"mode": 1,
							"prevHandle": {
								"dv": -0.7791687967413733,
								"dt": -0.009885296599675665
							},
							"nextHandle": {
								"dv": -0.8766645365919601,
								"dt": 0.10452410158226158
							}
						},
						{
							"time": 3.6354253892489723,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.005833333333333329,
								"dt": -3.2107886639318926
							},
							"nextHandle": {
								"dv": -0.0001150926715946202,
								"dt": 0.06342950122681006
							}
						}
					]
				},
				{
					"type": "object",
					"name": "ElecFloor",
					"enabled": false,
					"z": 0.5,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "model",
							"name": "DiskFlatStraight01_MoreVrtx",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 100,
							"rotationZ": 29.999999999999993,
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
											"emissive": 3
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
												"alpha": 1,
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
												"progress": 0.22,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													-0.5
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
																"position": 0.67578125,
																"color": -11796492
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
						},
						{
							"type": "model",
							"name": "DiskFlatStraight01_MoreVrtx",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 120,
							"scaleY": 120,
							"scaleZ": 120,
							"rotationZ": 45.00000000000001,
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
											"emissive": 3
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
												"alpha": 1,
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
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_02.png",
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
												"progress": 0.22,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													-0.5
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
																"position": 0.67578125,
																"color": -11796492
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.05357142857142857,
											"value": 1.0333333333333334,
											"mode": 2
										},
										{
											"time": 0.16326530612244897,
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
					"type": "model",
					"name": "Sparks",
					"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
					"scaleX": 175,
					"scaleY": 175,
					"scaleZ": 175,
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
									"emissive": 3
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
										"alpha": 0.75,
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
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
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
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 9,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_DirectionalSparks02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "uvShift.y",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.00510204081632653,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06654832772809262,
														"dt": -0.49972701833766753
													},
													"nextHandle": {
														"dv": -0.2613168724279835,
														"dt": 1.9808112942442606
													}
												},
												{
													"time": 4,
													"value": 8,
													"mode": 0,
													"prevHandle": {
														"dv": 3.5411522633744856,
														"dt": -0.5430397500797186
													},
													"nextHandle": {
														"dv": -4.577271049626095,
														"dt": 0.6943798595279973
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
										"progress": 0.2,
										"saturation": 1,
										"width": 0.79,
										"uvScaleX": 5,
										"uvScaleY": 2.5,
										"texture": "Fx/noise/Wave_01.jpg",
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
														"position": 0.67578125,
														"color": -11796492
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
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
													"mode": 2
												},
												{
													"time": 0.75,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.008385456545577541,
														"dt": -0.6123210003505557
													},
													"nextHandle": {
														"dv": 0.011460573127326939,
														"dt": 0.6625549571754686
													}
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
										"threshold": 0.02,
										"useRGB": false
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
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.75,
									"value": 1.5,
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
				}
			]
		}
	]
}