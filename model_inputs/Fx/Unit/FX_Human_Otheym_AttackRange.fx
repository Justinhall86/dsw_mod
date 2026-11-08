{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
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
			"name": "Old",
			"enabled": false,
			"children": [
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"children": [
						{
							"type": "emitter",
							"name": "Hit",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.1,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.5,
								"instScale": 2
							},
							"x": 2.22877,
							"y": 0.9324,
							"z": 5.18798,
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
															"time": 0.525,
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
															"time": 0.6200000000000001,
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
															"time": 0.865,
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
											"props": {
												"amount": 1,
												"color": [
													1,
													0.5686274509803921,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.36500000000000005,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.915,
															"value": 0,
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
													"time": 0.4650000000000001,
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
													"time": 1.22,
													"value": 5,
													"mode": 2
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
											"mode": 0,
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
											"time": 0.915,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "projectileVertical",
							"enabled": false,
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"instStretch": [
									5,
									30,
									5
								],
								"lifeTime": 0.5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitType": "Burst",
								"burstDelay": 0.1,
								"lifeTimeRand": 0.1
							},
							"x": -0.47951333333333346,
							"y": 0.8004566666666667,
							"z": 1.7864866666666668,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"scaleX": 0.08,
									"scaleY": 0.11,
									"scaleZ": 0.08,
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
													"emissive": 4
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
												"alpha": 0.05,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.56,
												"saturation": 0,
												"width": 0.7,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/Dissolve_lines.jpg.png",
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
															"value": 1.005,
															"mode": 0,
															"prevHandle": {
																"dv": 0.7856981969617335,
																"dt": -0.42607514163596477
															},
															"nextHandle": {
																"dv": -1.005,
																"dt": 0.5449999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.76,
												"uvScaleX": 1,
												"uvScaleY": 0.12,
												"texture": "Fx/noise/perlin4.jpg",
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
															"value": 1.005,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26396493179483227,
																"dt": -0.4799362396269668
															},
															"nextHandle": {
																"dv": -0.36849999999999994,
																"dt": 0.6699999999999999
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
												"range": 1.2,
												"power": 1.2
											},
											"isInstance": true
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.94,
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
							"name": "projectileVertical",
							"enabled": false,
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"instStretch": [
									6,
									30,
									6
								],
								"lifeTime": 0.5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitType": "Burst",
								"burstDelay": 0.1,
								"lifeTimeRand": 0.1
							},
							"x": 0.9027566666666665,
							"y": 0.8004566666666667,
							"z": 1.7864866666666668,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"scaleX": 0.08,
									"scaleY": 0.11,
									"scaleZ": 0.08,
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
													"emissive": 4
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
												"alpha": 0.05,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.56,
												"saturation": 0,
												"width": 0.7,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Dissolve_lines.jpg.png",
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
															"value": 1.005,
															"mode": 0,
															"prevHandle": {
																"dv": 0.7856981969617335,
																"dt": -0.42607514163596477
															},
															"nextHandle": {
																"dv": -1.005,
																"dt": 0.5449999999999999
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 0.76,
												"uvScaleX": 1,
												"uvScaleY": 0.12,
												"texture": "Fx/noise/perlin4.jpg",
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
															"value": 1.005,
															"mode": 0,
															"prevHandle": {
																"dv": 0.26396493179483227,
																"dt": -0.4799362396269668
															},
															"nextHandle": {
																"dv": -0.36849999999999994,
																"dt": 0.6699999999999999
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
												"range": 1.2,
												"power": 1.2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.4,
												"sandColorSet": false,
												"envBlend": 0.3,
												"envColorSet": false
											}
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.94,
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
							"name": "Reactor_1",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 0.16,
								"speedFactor": 0.1,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0.15,
									0,
									0
								],
								"instStretch": [
									0.6,
									0.8,
									0.8
								]
							},
							"x": 0.9628766666666665,
							"y": -1.0215533333333333,
							"z": -3.0771033333333335,
							"scaleX": 0.08333333333333334,
							"scaleY": 0.08333333333333334,
							"scaleZ": 0.08333333333333333,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.5,
									"rotationY": -90,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
													0
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.87,
												"color": [
													0.16470588235294117,
													0.2784313725490196,
													1
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Reactor_2",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"instScale": 0.2,
								"emitOrientation": "Speed",
								"emitShape": "Cone",
								"emitAngle": 0,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch": [
									0.7,
									0.7,
									0.7
								],
								"instScale_rand": 0,
								"lifeTime": 0.075
							},
							"x": -1.8656333333333335,
							"y": 0.2210966666666667,
							"z": 1.2906166666666667,
							"scaleX": 0.08333333333333334,
							"scaleY": 0.08333333333333334,
							"scaleZ": 0.08333333333333333,
							"rotationX": -46.50000000000001,
							"rotationY": -16.099999999999998,
							"rotationZ": 6.799999999999999,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.4,
									"rotationY": -90,
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
													"emissive": 20
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
												"progress": 0.12,
												"saturation": 1,
												"width": 0.59,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.24,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
													0
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.27058823529411763,
													0.0784313725490196
												]
											},
											"isInstance": true
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sand_Floor",
					"enabled": false,
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
						"frameCount": 32,
						"frameDivisionX": 8,
						"frameDivisionY": 8,
						"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
						"instScale": 22,
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
						"warmUpTime": -0.75,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5
					},
					"x": 7.76915,
					"y": -0.87731,
					"z": -0.3276242857142858,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 0.01,
					"rotationZ": 43.6,
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
										"scale": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.5
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
											0.7137254901960784,
											0.7137254901960784,
											0.7137254901960784
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
										"width": 0.45,
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
										"range": 25,
										"power": 50
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
									"envBlend": 0.5
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
										"dv": -0.07620241819144336,
										"dt": -0.9450000000000001
									},
									"nextHandle": {
										"dv": 0.021440078189261927,
										"dt": 0.265882295729136
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
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sand_Floor",
					"enabled": false,
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
						"frameCount": 32,
						"frameDivisionX": 8,
						"frameDivisionY": 8,
						"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
						"instScale": 10,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 2,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -1,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"speedFactor": 1.5
					},
					"x": 6.63195,
					"y": 0.4634999999999999,
					"z": 3.5582857142857143,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 0.01,
					"rotationZ": 43.6,
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
										"alpha": 1
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
											0.7137254901960784,
											0.7137254901960784,
											0.7137254901960784
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
										"range": 25,
										"power": 50
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
									"envBlend": 0.5
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
										"dv": -0.07620241819144336,
										"dt": -0.9450000000000001
									},
									"nextHandle": {
										"dv": 0.021440078189261927,
										"dt": 0.265882295729136
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
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"x": -6.28407,
					"y": -0.94921,
					"z": -0.2966442857142858,
					"children": [
						{
							"type": "polygon",
							"name": "SlashDistort",
							"x": 2.61573,
							"y": -1.27215,
							"z": 1.65473,
							"scaleX": 4.2,
							"scaleY": 4.2,
							"scaleZ": 4.2,
							"rotationX": 54.4,
							"rotationY": -23.3,
							"rotationZ": 6.4,
							"kind": 1,
							"args": [
								24,
								245.45,
								0.49,
								12
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
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.008
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
										"shiftSpeedY": 0,
										"USE_SOURCE_UV": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.7758205027002718,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.3641562705724775,
													"value": 1.067704238891602,
													"mode": 0,
													"prevHandle": {
														"dv": 2.220446049250313e-16,
														"dt": -0.5599999999999999
													},
													"nextHandle": {
														"dv": -9.460471999616726e-16,
														"dt": 0.3316719842180907
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
													"time": -0.10818588116757355,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.04818175693045633,
														"dt": -0.49954845585497076
													},
													"nextHandle": {
														"dv": -0.03472222222222221,
														"dt": 0.36
													}
												},
												{
													"time": 0.9905630579736266,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9895833333333335,
														"dt": -0.04999999999999993
													},
													"nextHandle": {
														"dv": -1.0069444444444446,
														"dt": 0.05500000000000005
													}
												},
												{
													"time": 1.4406399203958646,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1388888888888889,
														"dt": -0.615
													},
													"nextHandle": {
														"dv": -0.043250236625664115,
														"dt": 0.19151204777844172
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
					"type": "emitter",
					"name": "Sand_Floor",
					"enabled": false,
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
							5
						],
						"frameCount": 32,
						"frameDivisionX": 8,
						"frameDivisionY": 8,
						"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
						"instScale": 12,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0.3,
							0
						],
						"burstParticleCount": 3,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -1.2,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"speedFactor": 1.5,
						"instStretch": [
							0.7,
							1.5,
							0.7
						],
						"instRotation": [
							0,
							0,
							-60
						]
					},
					"x": 8.21597,
					"y": 1.3353900000000003,
					"z": -1.3003142857142858,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 0.01,
					"rotationZ": 43.6,
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
										"alpha": 1.5
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
											0.7137254901960784,
											0.7137254901960784,
											0.7137254901960784
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
										"range": 0.5,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
									"envBlend": 0.5
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
										"dv": -0.07620241819144336,
										"dt": -0.9450000000000001
									},
									"nextHandle": {
										"dv": 0.021440078189261927,
										"dt": 0.265882295729136
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
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
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
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -1.7624920997368847,
										"dt": -0.42438954506822385
									},
									"nextHandle": {
										"dv": 1.2666666666666666,
										"dt": 0.305
									}
								},
								{
									"time": 1.005,
									"value": 1.5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"enabled": false,
					"x": -6.28407,
					"y": -0.94921,
					"z": -0.2966442857142858,
					"time": 0.275,
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
									"emissive": 5,
									"depthTest": "LessEqual"
								}
							}
						},
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.58,
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
											"time": 0.63,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7850000000000001,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.9004516601562502,
												"dt": -0.1200000000000001
											},
											"nextHandle": {
												"dv": -3.37047699629145,
												"dt": 0.4455894061747684
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
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.58,
								"saturation": 5,
								"width": 0.08,
								"uvScaleX": 0.1,
								"uvScaleY": 0.1,
								"texture": "Fx/noise/bluenoise_raw.png",
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 2.27,
								"power": 3.79
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
									0.2392156862745098,
									0.06666666666666667
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.6499999999999999,
											"value": 0.9466666666666667,
											"mode": 2
										},
										{
											"time": 0.69,
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
								"amount": 0.8,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Harkonnen/Unit/Rabban/Male01_HarkonnenRabban.fbx",
					"enabled": false,
					"x": -6.28407,
					"y": -0.94921,
					"z": -0.2966442857142858,
					"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx",
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
									"depthTest": "LessEqual",
									"enableStencil": false,
									"alphaKill": false,
									"emissive": 10
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"materialName": "any"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0
							},
							"targetMaterial": "Mat_Rabban"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 1
							},
							"targetMaterial": "Mat_Whip"
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": false,
								"progress": 0.71,
								"saturation": 1,
								"width": 0.2,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/Gradient_Whip.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							},
							"targetMaterial": "Mat_Whip"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": true,
								"REVERSE": false,
								"bias": 0.36,
								"scale": 0.1,
								"power": 10,
								"color": [
									0.7294117647058823,
									0.1411764705882353,
									0.047058823529411764
								]
							}
						},
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Rabban/Anim_Male01_Rabban_AttackMelee01.fbx",
							"offset": -0.001
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": false,
								"Z": false,
								"texScaleX": 0,
								"texScaleY": 0,
								"tex": "Fx/DistortionMaps/waveNormal.jpg",
								"intensity": 2,
								"scrollSpeed": [
									0,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "intensity",
									"keys": [
										{
											"time": 0.7047949218750001,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8649755859375001,
											"value": 5,
											"mode": 2
										},
										{
											"time": 0.8890026855468751,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2,
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
									0.6235294117647059,
									0.13725490196078433,
									0.09019607843137255
								]
							}
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"enabled": false,
					"x": -6.28407,
					"y": -0.94921,
					"z": -0.2966442857142858,
					"time": 0.42188,
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.4392156862745098,
									0.4196078431372549
								]
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
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
								"progress": 0.78,
								"saturation": 5,
								"width": 0.82,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/vGrad.png",
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
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.58,
								"saturation": 5,
								"width": 0.08,
								"uvScaleX": 0.1,
								"uvScaleY": 0.1,
								"texture": "Fx/noise/bluenoise_raw.png",
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
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.74,
			"scaleY": 0.74,
			"scaleZ": 0.74,
			"children": [
				{
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Fremen/Unit/Otheym/Male01_FremenOtheym.fbx",
					"editorOnly": true,
					"scaleX": 2.8,
					"scaleY": 2.8,
					"scaleZ": 2.8,
					"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_AttackMelee.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_AttackRange.fbx"
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
					"type": "model",
					"name": "Bazooka",
					"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
					"editorOnly": true,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000004,
					"scaleZ": 1.0000000000000002,
					"rotationX": -98.50000000000001,
					"rotationY": -0.6999999999999998,
					"rotationZ": 1.9999999999999998
				},
				{
					"type": "constraint",
					"name": "constraint",
					"editorOnly": true,
					"object": "FXAnimation.FXRoot.Bazooka",
					"target": "FXAnimation.FXRoot.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
				},
				{
					"type": "polygon",
					"name": "Muzzle Mesh",
					"x": 2.5,
					"y": 0.76,
					"z": 5.08689,
					"scaleX": 6,
					"scaleY": 6,
					"scaleZ": 0.1,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 6
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
								"useScale": false,
								"wrap": true,
								"progress": 0.5,
								"saturation": 1,
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
									1.5
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
											"time": 0.04976985894580552,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.07747559734939104,
											"value": 0.8948601617813111,
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
											"time": 0.5170810908838573,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"enabled": false,
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
							"props": {
								"amount": 1,
								"color": [
									1,
									0.3058823529411765,
									0.14901960784313725
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.09179553801288515,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.14255241079370512,
											"value": 0.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.06738327291021036,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.4055177299392094,
										"dt": -0.30184489345109466
									},
									"nextHandle": {
										"dv": 1.4055177299392094,
										"dt": 0.30184489345109466
									}
								},
								{
									"time": 1.952398843930635,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.06738327291021036,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.1450823284205534,
										"dt": -0.3931348960760381
									},
									"nextHandle": {
										"dv": -2.1675416994094854,
										"dt": 0.3947398843930635
									}
								},
								{
									"time": 1.952398843930635,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.04976985894580552,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -3.56996247343095,
										"dt": -0.013222083234929478
									},
									"nextHandle": {
										"dv": 1.0666666666666667,
										"dt": 0.005308641975308684
									}
								},
								{
									"time": 0.5667274327036768,
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
								"amount": 0.88,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "Muzzle Mesh",
					"x": 2.5,
					"y": 0.66553,
					"z": 4.93689,
					"scaleX": 6,
					"scaleY": 6,
					"scaleZ": 0.1,
					"rotationX": -90,
					"rotationY": 90,
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
									"emissive": 6
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
								"useScale": false,
								"wrap": true,
								"progress": 0.5,
								"saturation": 1,
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
									1.5
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
											"time": 0.04976985894580552,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.07747559734939104,
											"value": 0.8948601617813111,
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
											"time": 0.5170810908838573,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"enabled": false,
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
							"props": {
								"amount": 1,
								"color": [
									1,
									0.3058823529411765,
									0.14901960784313725
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.09179553801288515,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.14255241079370512,
											"value": 0.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.06738327291021036,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.4055177299392094,
										"dt": -0.30184489345109466
									},
									"nextHandle": {
										"dv": 1.4055177299392094,
										"dt": 0.30184489345109466
									}
								},
								{
									"time": 1.952398843930635,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.06738327291021036,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.1450823284205534,
										"dt": -0.3931348960760381
									},
									"nextHandle": {
										"dv": -2.1675416994094854,
										"dt": 0.3947398843930635
									}
								},
								{
									"time": 1.952398843930635,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.04976985894580552,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -3.56996247343095,
										"dt": -0.013222083234929478
									},
									"nextHandle": {
										"dv": 1.0666666666666667,
										"dt": 0.005308641975308684
									}
								},
								{
									"time": 0.5667274327036768,
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
								"amount": 0.88,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": -5.3,
					"z": 1.21,
					"scaleX": 8,
					"scaleY": 9,
					"scaleZ": 0.1,
					"rotationX": -16.36,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 0.3,
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
								"alpha": 2,
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
											"time": 0.011403486728668213,
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
											"time": 0.798244071006776,
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
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"enabled": false,
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
									0.3058823529411765,
									0.14901960784313725
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.24809227374130882,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.3450741556618037,
											"value": 0.5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.17105230093002344,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 3.191729345188174,
										"dt": -0.2891727408212719
									},
									"nextHandle": {
										"dv": -3.191729345188174,
										"dt": 0.2891727408212719
									}
								},
								{
									"time": 1.4140323543548603,
									"value": -5,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.20144741006298333,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.1450823284205534,
										"dt": -0.3931348960760381
									},
									"nextHandle": {
										"dv": -2.1675416994094854,
										"dt": 0.3947398843930635
									}
								},
								{
									"time": 2.672680502524011,
									"value": -1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.10263138055801406,
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
									"time": 1.1555514296683567,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Back_Sand",
					"props": {
						"instScale_rand": 2,
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
						"instScale": 4,
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
							5,
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
							7,
							0,
							0
						],
						"burstParticleCount": 3
					},
					"x": -4.47591,
					"y": 0.97669,
					"z": 0.70357,
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
										"alpha": 0.5
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
				},
				{
					"type": "object",
					"name": "Muzzle",
					"x": 1.13047,
					"y": 0.48,
					"z": 4.75072,
					"rotationX": -11.6,
					"rotationZ": 90,
					"children": [
						{
							"type": "emitter",
							"name": "Smoke_Screen",
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
									0
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 5,
								"emitType": "Burst",
								"burstDelay": 0.05,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.2,
								"alignMode": "Screen",
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed": [
									3,
									0,
									0
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
								"instAcceleration": [
									-3,
									0,
									0
								],
								"lifeTime": 1.8,
								"speedFactor": 1.5
							},
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": -90,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
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
												"scale": 2
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
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00782367857939008,
																"dt": -0.03520655360725527
															},
															"nextHandle": {
																"dv": -0.15000000000000002,
																"dt": 0.674375
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.15625
															},
															"nextHandle": {
																"dv": 0.03384085855991686,
																"dt": 0.3197961133912159
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
													0.9254901960784314,
													0.8,
													0.6549019607843137
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
												"range": 0.1,
												"power": 1
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
												"progress": 0.5,
												"saturation": 0.1,
												"width": 1,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
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
																"dv": 0.17597127610376737,
																"dt": -0.6268976711196711
															},
															"nextHandle": {
																"dv": -0.1333333333333333,
																"dt": 0.47500000000000003
															}
														},
														{
															"time": 1,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.4642857142857143
															},
															"nextHandle": {
																"dv": 0.008539703073546545,
																"dt": 0.4361348355418391
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0520769766684747,
																"dt": -0.49993897601734766
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.6399999999999999
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
											"value": 0.012707392165911546,
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
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10219946215442799,
												"dt": -0.79
											},
											"nextHandle": {
												"dv": 0.0338972586912773,
												"dt": 0.267255905650836
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
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
								"lifeTime": 0.8,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 12,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"animationLoop": false,
								"warmUpTime": 0.05
							},
							"y": -0.8784,
							"z": -0.10436,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 2.5,
									"rotationX": 90,
									"rotationY": 90,
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
													"culling": "Back"
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
												"intensity": 0.03
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
											"mode": 0,
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
											"mode": 0,
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
					"type": "shader",
					"name": "EnvColorMult",
					"source": "shaders/EnvColorMult.hx",
					"enabled": false,
					"props": {
						"sandBlend": 0,
						"sandColorSet": false,
						"envBlend": 0.1,
						"envColorSet": false
					}
				},
				{
					"type": "emitter",
					"name": "Smoke_Gun",
					"props": {
						"lifeTime": 6,
						"alignMode": "Screen",
						"instScale_rand": 0.4,
						"maxCount": 100,
						"instRotation_rand": [
							0,
							0,
							45
						],
						"simulationSpace": "World",
						"instStretch_rand": [
							0.2,
							0.2,
							0.2
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0.4,
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
							0.3803921568627451
						],
						"emitAngle": 0,
						"emitRate": 2,
						"lifeTimeRand": 0.5,
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"instAcceleration": [
							0.1,
							0,
							0
						],
						"useRandomColor": true,
						"instAcceleration_rand": [
							0.05,
							0.02,
							0.01
						],
						"enableSort": false,
						"speedFactor": 3,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstCount": 60,
						"burstDelay": 0.1,
						"instWorldSpeed": [
							0.1,
							0,
							0.7
						],
						"instWorldSpeed_rand": [
							0.05,
							0.1,
							0.3
						],
						"instStretch": [
							0.7,
							1,
							0.7
						]
					},
					"x": 2.25422,
					"y": 0.48005,
					"z": 4.61094,
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
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"drawOrder": "-100"
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
										"scale": 4
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
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
													"value": 0.033333333333333326,
													"mode": 2
												},
												{
													"time": 0.09499999999999999,
													"value": 0.9863636363636362,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008786899796430459,
														"dt": -0.03490382642970474
													},
													"nextHandle": {
														"dv": -0.22055555555555562,
														"dt": 0.8749999999999999
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7725490196078432,
											0.7725490196078432,
											0.7725490196078432
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0.1,
										"power": 1
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/perlin2.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
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
														"dv": 0.8483515290485304,
														"dt": -0.43041364341432775
													},
													"nextHandle": {
														"dv": -1.1333333333333333,
														"dt": 0.575
													}
												},
												{
													"time": 1.2700000000000005,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"enabled": false,
									"props": {
										"levelMin": 0.5,
										"levelMax": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.19,
									"topSpan": 0.34,
									"dirIntensity": 0.36,
									"dirSpan": 0.47,
									"sandBlend": 0.6,
									"envBlend": 0.5,
									"envColorSet": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
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
									"value": -0.026997755331088613,
									"mode": 0,
									"prevHandle": {
										"dv": -3.804478157639296,
										"dt": -0.1254911758516944
									},
									"nextHandle": {
										"dv": 0.8159708193041526,
										"dt": 0.026899705581763078
									}
								},
								{
									"time": 0.04804712461674793,
									"value": 0.8593153759820427,
									"mode": 0
								},
								{
									"time": 0.7252142857142857,
									"value": 0.15589225589225586,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.24173809523809522
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.24173809523809522
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.8583185031426556e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.14172795189504372
									}
								},
								{
									"time": 0.16999999999999998,
									"value": 1.0066758116140837,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.056666666666666664
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22999999999999998
									}
								},
								{
									"time": 0.8443367346938775,
									"value": 0.24709315375982055,
									"mode": 0,
									"prevHandle": {
										"dv": -0.09289936401047516,
										"dt": -0.23928571428571432
									},
									"nextHandle": {
										"dv": 0.1080057274948862,
										"dt": 0.28240124663407146
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
									"value": 0.7043395109298409,
									"mode": 2
								},
								{
									"time": 0.075,
									"value": 0.996416691904285,
									"mode": 0,
									"prevHandle": {
										"dv": -0.13401470643179816,
										"dt": -0.05076638159507274
									},
									"nextHandle": {
										"dv": 0.4355722402597402,
										"dt": 0.16500000000000004
									}
								},
								{
									"time": 1.2700000000000005,
									"value": 1.3246642561983473,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 1.0333333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.851303742790108,
										"dt": -0.48341891108438234
									},
									"nextHandle": {
										"dv": -0.4666666666666668,
										"dt": 0.265
									}
								},
								{
									"time": 1.2585000000000002,
									"value": 0.1696969696969698,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3266666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3266666666666666
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keys": [
								{
									"time": -0.02064854782840366,
									"value": -0.06666666666666667,
									"mode": 2
								},
								{
									"time": 0.16806608046895832,
									"value": -2.8666666666666667,
									"mode": 2
								},
								{
									"time": 0.6024617639221961,
									"value": -2.92258892292157,
									"mode": 2
								},
								{
									"time": 0.6024617639221961,
									"value": -2.92258892292157,
									"mode": 2
								},
								{
									"time": 1.4052627231548116,
									"value": 0.2865625178460802,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keys": [
								{
									"time": -0.018063415933919268,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.16548094857447393,
									"value": 1.8401485810987666,
									"mode": 2
								},
								{
									"time": 0.6024617639221961,
									"value": 1.8401485810987666,
									"mode": 2
								},
								{
									"time": 1.4052627231548116,
									"value": 0.10824403418228035,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keys": [
								{
									"time": -0.02323367972288813,
									"value": -0.06666666666666667,
									"mode": 2
								},
								{
									"time": 0.18616200373034905,
									"value": 0.7666666666666667,
									"mode": 2
								},
								{
									"time": 1.4181883826272337,
									"value": -0.03333333333333333,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Flash",
					"props": {
						"lifeTime": 0.1,
						"emitType": "Burst",
						"maxCount": 1,
						"alignMode": "Screen",
						"instScale": 10
					},
					"x": 1.97314,
					"y": 0.51747,
					"z": 4.97859,
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
										"alpha": 0.2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle4.png"
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
											0.8117647058823529,
											0.596078431372549
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 2.3379300329638317,
														"dt": -0.26072500472698734
													},
													"nextHandle": {
														"dv": -0.9849817788097429,
														"dt": 0.11
													}
												},
												{
													"time": 0.5399999999999999,
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
					"type": "emitter",
					"name": "Flash_Stars",
					"props": {
						"lifeTime": 0.1,
						"emitType": "Burst",
						"maxCount": 1,
						"alignMode": "Screen",
						"instScale": 5
					},
					"x": 1.73229,
					"y": 0.51747,
					"z": 5.07095,
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
											"colorMask": 255,
											"emissive": 1,
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
										"alpha": 0.5,
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
											1,
											0.7725490196078432,
											0.596078431372549
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 2.3379300329638317,
														"dt": -0.26072500472698734
													},
													"nextHandle": {
														"dv": -0.9849817788097429,
														"dt": 0.11
													}
												},
												{
													"time": 0.5399999999999999,
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
				}
			]
		}
	]
}