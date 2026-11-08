{
	"type": "fx",
	"duration": 1.5,
	"cullingRadius": 20,
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
			"name": "Otheym",
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Fremen/Unit/Otheym/Male01_FremenOtheym.fbx",
					"scaleX": 2.8000000000000007,
					"scaleY": 2.8000000000000007,
					"scaleZ": 2.8000000000000007,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Otheym/Anim_Male01_Otheym_Skill.fbx"
						}
					]
				},
				{
					"type": "model",
					"name": "Bazooka",
					"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
					"rotationX": -98.5,
					"rotationY": -0.7,
					"rotationZ": 2
				},
				{
					"type": "model",
					"name": "Bazooka_mat",
					"source": "Character/Fremen/Weapon/Bazooka/Bazooka.fbx",
					"enabled": false,
					"x": -0.00012,
					"y": 0.00102,
					"z": 0.00676,
					"scaleX": 1.1,
					"scaleY": 1.01,
					"scaleZ": 1.1,
					"rotationX": -98.5,
					"rotationY": -0.7,
					"rotationZ": 2,
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
									"emissive": 20
								}
							}
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": false,
								"ALPHA": true,
								"REVERSE": false,
								"bias": -0.15,
								"scale": 1,
								"power": 1,
								"color": [
									0,
									0,
									0
								]
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.4511179929140826,
											"value": 0,
											"mode": 1
										},
										{
											"time": 0.4611179929140826,
											"value": 1,
											"mode": 1
										},
										{
											"time": 0.6732068509640925,
											"value": 0,
											"mode": 1
										},
										{
											"time": 1.0222470186344375,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.11384693995679285
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.06526080676176826
											}
										},
										{
											"time": 1.0845414250888525,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaCycle",
							"source": "shaders/AlphaCycle.hx",
							"props": {
								"minAlpha": 0.5,
								"maxAlpha": 1,
								"frequency": 2
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
												"color": -319772357
											},
											{
												"position": 1,
												"color": -319035707
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.Otheym.Bazooka",
					"target": "FXAnimation.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Otheym.Bazooka_mat",
					"target": "FXAnimation.FXRoot.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": -0.1,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "object",
					"name": "Skill",
					"children": [
						{
							"type": "object",
							"name": "Hand",
							"children": [
								{
									"type": "model",
									"name": "Missile",
									"source": "Character/Fremen/Weapon/Bazooka/Missile.fbx",
									"x": 0.09267,
									"y": -0.00051,
									"z": -0.03967,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": 52.2,
									"rotationZ": 110.9,
									"children": [
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.554666634784977,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5809646529266905,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9973226541908187,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.030243984523331,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Missile",
									"source": "Character/Fremen/Weapon/Bazooka/Missile.fbx",
									"x": 0.09267,
									"y": -0.00051,
									"z": -0.03967,
									"scaleX": 1.25,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationX": 52.2,
									"rotationZ": 110.9,
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
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0,
												"scale": 1,
												"power": 1,
												"color": [
													0,
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
																"color": -319772357
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
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.7561467311641685,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08978707685423037
															}
														},
														{
															"time": 1.0255079617268597,
															"value": 1,
															"mode": 1
														},
														{
															"time": 1.0437662637160618,
															"value": 0,
															"mode": 1
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
		},
		{
			"type": "constraint",
			"name": "constraint",
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Otheym.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon.B_Weapon_Add"
		}
	]
}