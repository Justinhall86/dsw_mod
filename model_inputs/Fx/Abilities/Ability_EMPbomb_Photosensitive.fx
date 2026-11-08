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
			"z": 0.5,
			"scaleX": 0.6,
			"scaleY": 0.6,
			"scaleZ": 0.6,
			"children": [
				{
					"type": "subFX",
					"name": "Ability_EMPbomb_Anticipation",
					"source": "Fx/Abilities/Ability_EMPbomb_Anticipation_Photosensitive.fx",
					"time": 0.17336,
					"children": [
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.058318605207948515,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.0683186052079483,
									"value": 1,
									"mode": 2
								},
								{
									"time": 5.302108056613722,
									"value": 1,
									"mode": 2
								},
								{
									"time": 5.312108056613722,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "Ability_EMPbomb_Explosion",
					"source": "Fx/Abilities/Ability_EMPbomb_Explosion_Photosensitive.fx",
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"time": 4.07972,
					"children": [
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 4.033710205851628,
									"value": 0,
									"mode": 2
								},
								{
									"time": 4.043710205851628,
									"value": 1,
									"mode": 2
								},
								{
									"time": 11.241649873301965,
									"value": 1,
									"mode": 2
								},
								{
									"time": 11.251649873301965,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "Ability_EMPbomb_AfterMath",
					"source": "Fx/Abilities/Ability_EMPbomb_AfterMath_Photosensitive.fx",
					"z": 0.5,
					"scaleX": 1.8,
					"scaleY": 1.8,
					"scaleZ": 1.8,
					"time": 4.12012,
					"children": [
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 3.9206914013206937,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3.9306914013206935,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "Ability_EMPbomb_ExplosionAnticipation",
					"source": "Fx/Abilities/Ability_EMPbomb_AfterMath_Photosensitive.fx",
					"enabled": false,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"time": 4.02,
					"children": [
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 3.8184362924593707,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3.8284362924593704,
									"value": 1,
									"mode": 2
								},
								{
									"time": 14.238413619469652,
									"value": 1,
									"mode": 2
								},
								{
									"time": 14.248413619469652,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Flash",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Flash",
							"scaleX": 2000,
							"scaleY": 2000,
							"scaleZ": 670,
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
										"alpha": 2
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.9557732004133641,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010885950310681472,
														"dt": -0.49993897601734766
													},
													"nextHandle": {
														"dv": -0.02657370235557971,
														"dt": 1.3787788228458198
													}
												},
												{
													"time": 4.05923815349518,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.05923815349518,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.05923815349518,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.05923815349518,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.06923815349518,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.06923815349518,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.06923815349518,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.06923815349518,
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
								},
								{
									"type": "curve",
									"name": "visibility",
									"enabled": false,
									"keys": [
										{
											"time": 0.5471168390097052,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.557116839009705,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.531795428686975,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.541795428686974,
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
						"instScale": 50,
						"warmUpTime": -3.9,
						"lifeTime": 0.5
					},
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.05,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
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
										"distortionDir": "Fx/DistortionMaps/waveNormal2.jpg",
										"intensity": 0.15
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.007876275510204082,
													"value": -0.009975691384993324,
													"mode": 0
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.018070909090909137,
														"dt": -0.23915178571428564
													},
													"nextHandle": {
														"dv": 0.01774418193074576,
														"dt": 0.235109654558856
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
										"scaleX": 4,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 5
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
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.9239350146379692,
										"dt": -0.3456633226416698
									},
									"nextHandle": {
										"dv": -1.0313970834121595,
										"dt": 0.04897839562381359
									}
								},
								{
									"time": 1,
									"value": 0,
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
					"type": "emitter",
					"name": "FlareBig",
					"enabled": false,
					"props": {
						"alignMode": "Screen",
						"alignLockAxis": "Z",
						"burstDelay": 0.05,
						"instScale": 350,
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
							0.7843137254901961,
							0.7843137254901961,
							0.7843137254901961,
							1
						],
						"emitType": "Burst",
						"lifeTime": 2,
						"instOffset": [
							0,
							0,
							75
						],
						"warmUpTime": -4
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
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"drawOrder": "100"
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_1024.png"
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
													"time": 0.9994830486111846,
													"value": 0,
													"mode": 0
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
														"color": -10584833
													},
													{
														"position": 0.203125,
														"color": -5637377
													},
													{
														"position": 0.76953125,
														"color": -1128
													},
													{
														"position": 1,
														"color": -21075
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Cubic",
												"colorMode": 0
											}
										}
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
		}
	]
}