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
					"name": "Female01_Drisq",
					"source": "Character/Smuggler/Unit/Drisq/Female01_SmugglersDrisq.fbx",
					"editorOnly": true,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_AttackMelee.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Female01/Drisq/Anim_Female01_Drisq_AttackRange_Air.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "DrisqSniper",
					"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqSniper.fbx",
					"editorOnly": true,
					"scaleY": 1.0000000000000004,
					"scaleZ": 1.0000000000000004,
					"rotationX": -90
				},
				{
					"type": "constraint",
					"name": "constraint",
					"editorOnly": true,
					"object": "FXAnimation.FXRoot.DrisqSniper",
					"target": "FXAnimation.FXRoot.Female01_Drisq.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
				},
				{
					"type": "object",
					"name": "Shot",
					"x": 2.48372,
					"y": 0.53709,
					"z": 4.63523,
					"rotationY": -35,
					"children": [
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
								"warmUpTime": 0.2,
								"instRotation": [
									-10,
									0,
									0
								]
							},
							"x": -0.19157499999999983,
							"y": 0.014363333333333506,
							"z": 0.40994000000000064,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 1.5,
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
												"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
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
						},
						{
							"type": "polygon",
							"name": "Muzzle Mesh",
							"x": 0.6585250000000005,
							"y": -0.030206666666666493,
							"z": -0.13075999999999954,
							"scaleX": 2.112904674261707,
							"scaleY": 3.521507790436178,
							"scaleZ": 0.07043015580872357,
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
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
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
													"time": 0.042054830725903214,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.06674595510630064,
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
													"time": 0.26851872654634307,
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
													"time": 0.07950776751107257,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.12474187175097402,
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.05775175923304121,
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
											"time": 1.737662009054352,
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
											"time": 0.05775175923304121,
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
											"time": 1.737662009054352,
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
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.304985487287721,
												"dt": -0.22508576390955617
											},
											"nextHandle": {
												"dv": 1.3109146118164066,
												"dt": 0.09000000000000001
											}
										},
										{
											"time": 0.502763134800275,
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
										"amount": 0.9,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Muzzle Mesh",
							"x": 0.6585250000000005,
							"y": 0.1400733333333335,
							"z": -0.005009999999999515,
							"scaleX": 2.112904674261707,
							"scaleY": 3.521507790436178,
							"scaleZ": 0.07043015580872357,
							"rotationZ": 89.99999999999999,
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
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
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
													"time": 0.042054830725903214,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.06674595510630064,
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
													"time": 0.26851872654634307,
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
													"time": 0.07950776751107257,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.12474187175097402,
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.05775175923304121,
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
											"time": 1.737662009054352,
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
											"time": 0.05775175923304121,
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
											"time": 1.737662009054352,
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
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.304985487287721,
												"dt": -0.22508576390955617
											},
											"nextHandle": {
												"dv": 1.3109146118164066,
												"dt": 0.09000000000000001
											}
										},
										{
											"time": 0.502763134800275,
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
										"amount": 0.9,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "projectileVertical",
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"instStretch": [
									3.2,
									80,
									3.2
								],
								"instStretch_rand": [
									0,
									10,
									0
								],
								"emitType": "Burst",
								"burstDelay": 0.1,
								"lifeTimeRand": 0.1
							},
							"x": -0.3347249999999997,
							"y": -0.0849966666666665,
							"z": -0.053029999999999244,
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
													"emissive": 6
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												0.4823529411764706,
												0.4823529411764706,
												0.4823529411764706,
												1
											]
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
												"alpha": 0.35,
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
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.3,
												"saturation": 1,
												"width": 0.69,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_SandWave_Double.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.5,
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
																"dv": 0.602693598513261,
																"dt": -0.4518633019051174
															},
															"nextHandle": {
																"dv": -0.72025,
																"dt": 0.5399999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.0293558462012566,
																"dt": -0.4755624009449802
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.385
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
												"progress": 0.4,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/sand_gaussian.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
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
																"dv": 0.602693598513261,
																"dt": -0.4518633019051174
															},
															"nextHandle": {
																"dv": -0.72025,
																"dt": 0.5399999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 1.0293558462012566,
																"dt": -0.4755624009449802
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.385
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.48,
												"saturation": 1,
												"width": 0.7,
												"uvScaleX": 0.11,
												"uvScaleY": 1,
												"texture": "Fx/noise/dustDissolveTwirl_01.jpg",
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
												"sandBlend": 0.1,
												"sandColorSet": false,
												"envBlend": 0.3,
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
													1,
													0.5411764705882353,
													0.14901960784313725
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
											"time": 1,
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
							"name": "Flash",
							"props": {
								"lifeTime": 0.05,
								"emitType": "Burst",
								"maxCount": 1,
								"alignMode": "Screen",
								"instScale": 10
							},
							"x": -0.39537500000000003,
							"y": -0.019616666666666505,
							"z": -0.11056999999999961,
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
												"alpha": 0.15,
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
						},
						{
							"type": "emitter",
							"name": "Flash_Stars",
							"props": {
								"lifeTime": 0.05,
								"emitType": "Burst",
								"maxCount": 1,
								"alignMode": "Screen",
								"instScale": 6
							},
							"x": -0.39537500000000003,
							"y": -0.019616666666666505,
							"z": -0.11056999999999961,
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
													"emissive": 2,
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
													0.5411764705882353,
													0.3333333333333333
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
				},
				{
					"type": "emitter",
					"name": "Douille",
					"props": {
						"lifeTime": 2,
						"warmUpTime": -0.9,
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
						"instScale": 0.4,
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
						]
					},
					"x": -0.59722,
					"y": 0.57249,
					"z": 2.16031,
					"rotationX": -44.7,
					"rotationY": -36.7,
					"rotationZ": 151.8,
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
									"mode": 0,
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
									"mode": 0,
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
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": -2.12,
					"z": 1.21,
					"scaleX": 5,
					"scaleY": 6,
					"scaleZ": 0.1,
					"rotationX": -16.4,
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
								"alpha": 0.5,
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
											"time": 0.010370119822719112,
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
											"time": 0.6702337844157357,
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
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.14425550104449059,
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
									"time": 1.18664882627114,
									"value": -5,
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
									"time": 0.08687605194944559,
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
									"time": 0.9698804317589137,
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
						"instScale_rand": 1.5,
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
						"instScale": 3,
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
							3,
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
							4,
							0,
							0
						],
						"burstParticleCount": 3
					},
					"x": -2.12411,
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
				}
			]
		}
	]
}