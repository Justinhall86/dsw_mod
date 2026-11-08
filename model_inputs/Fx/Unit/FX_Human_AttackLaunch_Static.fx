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
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Male01_HeavyWeaponSquad",
					"source": "Character/Fremen/Unit/Watcher/Female01_Watcher.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Female01/Anim_Female01_AttackLaunch.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "LIGHT",
					"children": [
						{
							"type": "emitter",
							"name": "Flare_LightGrenadeMoving",
							"enabled": false,
							"props": {
								"lifeTime": 0.02,
								"emitType": "Burst",
								"burstDelay": 0.15,
								"alignMode": "Screen",
								"instScale_rand": 0.1,
								"instScale": 0.75,
								"warmUpTime": -2.5,
								"maxCount": 2,
								"instSpeed": [
									30,
									0,
									8.5
								],
								"burstCount": 2,
								"instStretch": [
									4,
									1.5,
									1
								],
								"instStretch_rand": [
									1,
									0.5,
									0
								],
								"instRotation_rand": [
									0,
									0,
									50
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
							"x": 2.1,
							"y": 1.2,
							"z": 3.6,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 8
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
												"texture": "Fx/Alphas/T_Flare04.png",
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
													1,
													0.1764705882352941,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 2.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.851215820312501,
											"value": 10.4,
											"prevHandle": {
												"dv": -0.27181386464770085,
												"dt": -0.05242295337148528
											},
											"nextHandle": {
												"dv": 0.27181386464770085,
												"dt": 0.05242295337148528
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.851,
											"value": 3.8,
											"prevHandle": {
												"dv": -0.5398568289620505,
												"dt": -0.11191064453124921
											},
											"nextHandle": {
												"dv": 0.5398568289620505,
												"dt": 0.11191064453124921
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LightGrenadeMoving_Halo",
							"props": {
								"lifeTime": 0.04,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"alignMode": "Screen",
								"instScale_rand": 0.1,
								"warmUpTime": -1.15,
								"maxCount": 2,
								"instSpeed": [
									48,
									0,
									20
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
							"x": 3.09639,
							"y": 1.2,
							"z": 4.17149,
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png",
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
													1,
													0.30980392156862746,
													0.16078431372549018
												]
											},
											"isInstance": true
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
											"time": 1.210545654296876,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.377553710937502,
											"value": 10.4,
											"prevHandle": {
												"dv": -0.27181386464770085,
												"dt": -0.05242295337148528
											},
											"nextHandle": {
												"dv": 0.27181386464770085,
												"dt": 0.05242295337148528
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.210545654296876,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3773378906250011,
											"value": 3.8,
											"prevHandle": {
												"dv": -0.5398568289620505,
												"dt": -0.11191064453124921
											},
											"nextHandle": {
												"dv": 0.5398568289620505,
												"dt": 0.11191064453124921
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LightGrenadeMoving",
							"enabled": false,
							"props": {
								"lifeTime": 0.04,
								"emitType": "Burst",
								"burstDelay": 0.15,
								"alignMode": "Screen",
								"instScale_rand": 0.1,
								"instScale": 0.7,
								"warmUpTime": -2.5,
								"maxCount": 2,
								"instSpeed": [
									30,
									0,
									8.5
								],
								"burstCount": 2,
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
							"x": 2.1,
							"y": 1.2,
							"z": 3.6,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 35
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
												"texture": "Fx/Alphas/T_circle.png",
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
													1,
													0.1764705882352941,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 2.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.851215820312501,
											"value": 10.4,
											"prevHandle": {
												"dv": -0.27181386464770085,
												"dt": -0.05242295337148528
											},
											"nextHandle": {
												"dv": 0.27181386464770085,
												"dt": 0.05242295337148528
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.851,
											"value": 3.8,
											"prevHandle": {
												"dv": -0.5398568289620505,
												"dt": -0.11191064453124921
											},
											"nextHandle": {
												"dv": 0.5398568289620505,
												"dt": 0.11191064453124921
											}
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
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "GRENADE",
					"children": [
						{
							"type": "emitter",
							"name": "GrenadeEmitter",
							"props": {
								"lifeTime": 0.15,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 0.4,
								"warmUpTime": -1.15,
								"instSpeed": [
									60,
									0,
									24
								],
								"instAcceleration": [
									0,
									0,
									-6
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
							"x": 2.2,
							"y": 1.1,
							"z": 3.7,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "model",
									"name": "Sphere",
									"source": "Fx/Meshes_Common/Sphere.fbx",
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
													"enableStencil": false,
													"alphaKill": true,
													"textureWrap": true
												}
											},
											"color": [
												0.29411764705882354,
												0.5176470588235293,
												0.38823529411764707,
												1
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
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
															"prevHandle": {
																"dv": 0.062035141292540716,
																"dt": -0.4999572868613606
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.537283950617284
															}
														},
														{
															"time": 0.6672153635116598,
															"value": 1,
															"prevHandle": {
																"dv": 2.906144259695379e-16,
																"dt": -0.25
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1841015089163237
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.03333333333333333,
																"dt": -0.16773662551440327
															},
															"nextHandle": {
																"dv": -0.010967972648824455,
																"dt": 0.0554627357649211
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.2,
											"prevHandle": {
												"dv": -0.008602765137642644,
												"dt": -0.5006809310108057
											},
											"nextHandle": {
												"dv": 0.008602765137642644,
												"dt": 0.5006809310108057
											}
										},
										{
											"time": 1,
											"value": 0.6,
											"mode": 2
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
											"value": 1.2,
											"prevHandle": {
												"dv": -0.008602765137642644,
												"dt": -0.5006809310108057
											},
											"nextHandle": {
												"dv": 0.008602765137642644,
												"dt": 0.5006809310108057
											}
										},
										{
											"time": 1,
											"value": 0.6,
											"mode": 2
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
												"dv": -0.00936602175210171,
												"dt": -0.5007103011184518
											},
											"nextHandle": {
												"dv": 0.013333333333333197,
												"dt": 0.7128039550781251
											}
										},
										{
											"time": 1,
											"value": 0.2,
											"prevHandle": {
												"dv": 0.8333333333333335,
												"dt": -0.1607133058984911
											},
											"nextHandle": {
												"dv": -1.510881990390972,
												"dt": 0.292874836524182
											}
										}
									]
								},
								{
									"type": "trails",
									"name": "Trails",
									"startWidth": 0.18,
									"lifetime": 0.5,
									"minSpeed": 0.18,
									"maxSpeed": 100,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/uGrad_inv.png",
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
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.45,
												"envColorSet": false
											},
											"isInstance": true
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