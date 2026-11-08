{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
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
					"name": "DrisqDrone",
					"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqDrone.fbx",
					"editorOnly": true,
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002
				},
				{
					"type": "object",
					"name": "DroneVFX",
					"y": 0.0022,
					"z": 0.21141,
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"rotationX": -90,
					"rotationY": 30,
					"rotationZ": -90,
					"children": [
						{
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.2,
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
							"y": -0.015000000000000013,
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
													"depthTest": "LessEqual",
													"drawOrder": "100",
													"emissive": 1.2
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.1416369455875629
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16315043438500232
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16315043438500232
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Dissolve",
											"source": "shaders/Dissolve.hx",
											"props": {
												"progress": 0.22,
												"saturation": 1,
												"width": 0.21,
												"useAlpha": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5372549019607843,
													0.7372549019607844,
													0.8509803921568627
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"enabled": false,
											"props": {
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": 0.014999999999999986,
							"scaleX": 0.3,
							"scaleY": 0.30000000000000004,
							"scaleZ": 0.35,
							"rotationX": -85.77892832218649,
							"rotationY": 7.784177124894296,
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
											"emissive": 2
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
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.23,
										"vOffset": -0.02,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
										"progress": 0.43,
										"saturation": 0,
										"width": 0.61,
										"uvScaleX": 0.03,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
										"progress": 0.39,
										"saturation": 0,
										"width": 0.87,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
									"isInstance": true
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6078431372549019,
											0.9098039215686274,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.19428162574768085
											}
										},
										{
											"time": 1,
											"value": 0.036035493827160495,
											"prevHandle": {
												"dv": 0.0014842592592592546,
												"dt": -0.5737262495979665
											},
											"nextHandle": {
												"dv": -0.0010087967234732624,
												"dt": 0.39237072216295604
											}
										},
										{
											"time": 2.4901266688108463,
											"value": -0.05302006172839509,
											"prevHandle": {
												"dv": 1.1633237446122722e-17,
												"dt": -0.9236824250221265
											},
											"nextHandle": {
												"dv": 6.938893903907228e-18,
												"dt": 1.0968728797137737
											}
										},
										{
											"time": 5.018801214694982,
											"value": 0.03325771604938271,
											"prevHandle": {
												"dv": 6.1895907671395486e-18,
												"dt": -0.6645054112300866
											},
											"nextHandle": {
												"dv": 0.00032525313527953514,
												"dt": 0.6385952568054201
											}
										},
										{
											"time": 6.467222208715979,
											"value": -0.05259431474374597,
											"prevHandle": {
												"dv": -0.0033095318828755974,
												"dt": -0.7401629547325598
											},
											"nextHandle": {
												"dv": 0.0025427715338694062,
												"dt": 0.6701816609874358
											}
										},
										{
											"time": 8,
											"value": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									],
									"loop": true
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3200925507893166
											}
										},
										{
											"time": 1.16233318284154,
											"value": 0.025372285353535327,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3200925507893166
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3465741158773501
											}
										},
										{
											"time": 2.6921821992844355,
											"value": 0,
											"prevHandle": {
												"dv": 0.0006715260571498896,
												"dt": -0.7792488246238579
											},
											"nextHandle": {
												"dv": -0.0007462436868686875,
												"dt": 0.8659522734582428
											}
										},
										{
											"time": 4.438519284091891,
											"value": 0.02441963383838381,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6637035364905998
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										},
										{
											"time": 6,
											"value": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									],
									"loop": true
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.DroneVFX",
					"target": ".FXRoot.DrisqDrone.A_DrisqDrone"
				}
			]
		}
	]
}