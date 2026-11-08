{
	"type": "fx",
	"cullingRadius": 150,
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
			"scaleX": 0.45,
			"scaleY": 0.45,
			"scaleZ": 0.45,
			"children": [
				{
					"type": "object",
					"name": "Drisq",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "DrisqSniper",
							"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqSniper.fbx",
							"editorOnly": true,
							"scaleY": 1.0000000000000007,
							"scaleZ": 1.0000000000000007,
							"rotationX": -89.99999999999999
						},
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Smuggler/Unit/Drisq/Female01_SmugglersDrisq.fbx",
							"editorOnly": true,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Drisq/Anim_Female01_Drisq_Skill.fbx"
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"editorOnly": true,
							"object": ".FXRoot.Drisq.DrisqSniper",
							"target": ".FXRoot.Drisq.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "object",
					"name": "passif",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "emitter",
							"name": "Particles",
							"enabled": false,
							"props": {
								"lifeTimeRand": 0.5,
								"burstParticleCount": 15,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.06,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"lifeTime": 2.5,
								"emitShape": "Cylinder",
								"emitRad2": 0.55,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360,
								"warmUpTime": -0.52,
								"randomColor1": [
									1,
									0.28627450980392155,
									0.28627450980392155,
									1
								],
								"randomColor2": [
									1,
									0.9019607843137255,
									0.7843137254901961,
									1
								],
								"instScale": 0.25,
								"instOrbitSpeed_rand": [
									0,
									0,
									0
								],
								"seedGroup": 1,
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
								},
								"simulationSpace": "World",
								"emitRate": 4,
								"instWorldSpeed": [
									0,
									0,
									5
								],
								"instWorldSpeed_rand": [
									0,
									0,
									2
								]
							},
							"scaleZ": 0.09,
							"rotationX": 90,
							"rotationZ": -103.2,
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
													"emissive": 5
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.065,
															"value": 1,
															"prevHandle": {
																"dv": 0.11089160652646488,
																"dt": -0.015692208470726162
															},
															"nextHandle": {
																"dv": -0.8833333333333333,
																"dt": 0.12500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.8384636488340191
															},
															"nextHandle": {
																"dv": 0.006154423696995358,
																"dt": 0.30991955512506614
															}
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
												"envBlend": 0.7,
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.56
											},
											"nextHandle": {
												"dv": 0.03967621425974007,
												"dt": 0.3332801997818148
											}
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
												"dv": 0.013194444444444398,
												"dt": -0.8841852909175679
											},
											"nextHandle": {
												"dv": -0.006407488794313876,
												"dt": 0.33335250704975594
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
											"prevHandle": {
												"dv": 2.844272778839864,
												"dt": -0.2607250047269874
											},
											"nextHandle": {
												"dv": -1.2,
												"dt": 0.11
											}
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.835
											},
											"nextHandle": {
												"dv": -5.442874662877125e-16,
												"dt": 0.33333333333333326
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
											0.3764705882352941,
											0.7607843137254902,
											1
										]
									}
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 1.54,
							"scaleY": 1.54,
							"scaleZ": 1.5400000000000003,
							"rotationX": 8.144776754718595e-16,
							"rotationY": -12.510601573582258,
							"rotationZ": 40.528856544984876,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "WhiteFlames",
									"y": -0.01,
									"z": 0.27735,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": -90,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 2,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/FireMask03.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 0.75,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/FireMask05.png",
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
													"keys": [
														{
															"time": 0.5919898485973163,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.762122570980946,
															"value": 0.25,
															"prevHandle": {
																"dv": 0.26643086747757283,
																"dt": -0.07011519803730601
															},
															"nextHandle": {
																"dv": -0.26643086747757283,
																"dt": 0.07011519803730601
															}
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
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.3,
												"scrollSpeed": [
													0,
													1
												],
												"scale": [
													1.25,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
											}
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
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3764705882352941,
													0.7607843137254902,
													1
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Glow",
									"x": -1.1102230246251565e-16,
									"z": 2.220446049250313e-16,
									"scaleX": 1.9999999999999996,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": -89.99999999999999,
									"rotationY": -9.467383808129004e-16,
									"rotationZ": -89.99999999999999,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle.png"
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 0.75,
												"color": [
													0.9882352941176471,
													0.5176470588235293,
													0.2
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.2,
												"maxAlpha": 1,
												"frequency": 2
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.3764705882352941,
													0.7607843137254902,
													1
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.8478217289466716,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.056710907461209936
											}
										},
										{
											"time": 1.111741629639519,
											"value": 1,
											"prevHandle": {
												"dv": 0.40844782039338057,
												"dt": -0.1405444228386507
											},
											"nextHandle": {
												"dv": -0.40844782039338057,
												"dt": 0.1405444228386507
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.passif",
					"target": ".FXRoot.Drisq.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ"
				}
			]
		}
	]
}