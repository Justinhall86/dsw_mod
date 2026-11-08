{
	"type": "fx",
	"cullingRadius": 1500,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Drone01",
					"enabled": false,
					"y": -0.11,
					"z": 7,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "model",
							"name": "DrisqDrone",
							"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqDrone.fbx",
							"enabled": false,
							"y": 0.10999999999999999,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"children": [
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
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
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7
							},
							"y": -0.11891,
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
													"emissive": 5
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": -0.04000000000000001,
							"scaleX": 0.3,
							"scaleY": 0.29999999999999993,
							"scaleZ": 0.35000000000000003,
							"rotationX": -75.5045357169207,
							"rotationY": 5.2375391861617215,
							"rotationZ": 7.984724493421353e-16,
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
											"emissive": 20
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
										"saturation": 1,
										"width": 0.61,
										"uvScaleX": 0.03,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.005,
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
										"saturation": 1,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": -0.04000000000000001,
							"scaleX": 0.3,
							"scaleY": 0.29999999999999993,
							"scaleZ": 0.35000000000000003,
							"rotationX": -75.5045357169207,
							"rotationY": 5.2375391861617215,
							"rotationZ": 1.5969448986842705e-15,
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
											"emissive": 20
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
										"alpha": 0.1,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"enabled": false,
							"y": -0.04000000000000001,
							"scaleX": 0.3,
							"scaleY": 0.29999999999999993,
							"scaleZ": 0.35000000000000003,
							"rotationX": -75.5045357169207,
							"rotationY": 5.2375391861617215,
							"rotationZ": 7.984724493421353e-16,
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
											"emissive": 20
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
											0.2,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"saturation": 1,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone02",
					"enabled": false,
					"x": 10.30721,
					"y": -0.11,
					"z": 7,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7
							},
							"y": -0.11891,
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
													"emissive": 5
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
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_512.png"
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"enabled": false,
							"y": -0.04000000000000001,
							"scaleX": 0.3,
							"scaleY": 0.29999999999999993,
							"scaleZ": 0.35000000000000003,
							"rotationX": -75.5045357169207,
							"rotationY": 5.2375391861617215,
							"rotationZ": 7.984724493421353e-16,
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
											"emissive": 20
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
										"saturation": 1,
										"width": 0.61,
										"uvScaleX": 0.03,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.005,
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
										"saturation": 1,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/SquareRay02.fbx",
							"enabled": false,
							"x": -0.0013,
							"y": -0.05545,
							"z": -0.01428,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
							"rotationX": -75.5045357169207,
							"rotationY": 5.2375391861617215,
							"rotationZ": 1.5969448986842705e-15,
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
											"emissive": 20
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
										"alpha": 0.1,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
							"enabled": false,
							"x": -0.0013,
							"y": -0.05545,
							"z": -0.01428,
							"scaleX": 25,
							"scaleY": 16.66,
							"scaleZ": 30,
							"rotationX": -90,
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
											"emissive": 20
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
										"alpha": 0.4,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.24,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 0.1
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
							"x": -0.0013,
							"y": -0.05545,
							"z": -0.01428,
							"scaleX": 30,
							"scaleY": 20,
							"scaleZ": 30,
							"rotationX": -90,
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
											"emissive": 20
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
										"alpha": 0.1,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.29,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": -0.04,
							"scaleX": 0.16,
							"scaleY": 0.15,
							"scaleZ": 0.2,
							"rotationX": -73.8,
							"rotationY": 5.2,
							"rotationZ": 0.6,
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
											"emissive": 20
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.24,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
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
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "UI_Window",
							"y": -1.09503,
							"z": -0.25731,
							"children": [
								{
									"type": "polygon",
									"name": "fond",
									"x": -0.00442,
									"z": -0.01959,
									"scaleX": 0.8,
									"scaleY": 0.85,
									"scaleZ": 0.8,
									"rotationX": 89.99999999999999,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_DroneUI_01.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 0.89,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Lines01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.41,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/Dust06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "border",
									"x": -0.00442,
									"z": -0.01959,
									"scaleX": 1.15,
									"scaleY": 1.22,
									"scaleZ": 1.15,
									"rotationX": 89.99999999999999,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Card_Pattern.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "circles",
									"x": 0.17002000000000006,
									"z": -0.019589999999999996,
									"children": [
										{
											"type": "polygon",
											"name": "round",
											"scaleX": 0.29999999999999993,
											"scaleY": 0.29999999999999993,
											"scaleZ": 0.3,
											"rotationX": 89.99999999999997,
											"rotationY": 64.23011126564673,
											"rotationZ": -7.315691768701423e-15,
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
															"emissive": 0.25
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
														"texture": "Fx/Alphas/T_Circle_4.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.08,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 1,
														"texture": "Fx/Gradients/cGrad.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 8,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.73,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
										},
										{
											"type": "polygon",
											"name": "round",
											"scaleX": 0.40000000000000013,
											"scaleY": 0.40000000000000013,
											"scaleZ": 0.40000000000000013,
											"rotationX": 89.99999999999997,
											"rotationY": -121.22988873435328,
											"rotationZ": -6.134463682916234e-15,
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
															"emissive": 0.5
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
														"texture": "Fx/Alphas/T_Circle_4.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.08,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 1,
														"texture": "Fx/Gradients/cGrad.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 8,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.92,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
										},
										{
											"type": "polygon",
											"name": "round",
											"scaleX": 0.19999999999999998,
											"scaleY": 0.19999999999999998,
											"scaleZ": 0.2,
											"rotationX": 89.99999999999999,
											"rotationY": 172.9068150208623,
											"rotationZ": 8.012710924327613e-16,
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
															"emissive": 0.5
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
														"texture": "Fx/Alphas/T_Circle_4.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.08,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 1,
														"texture": "Fx/Gradients/cGrad.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.y",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.92,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
										},
										{
											"type": "polygon",
											"name": "round",
											"scaleX": 0.09999999999999999,
											"scaleY": 0.09999999999999999,
											"scaleZ": 0.1,
											"rotationX": 89.99999999999999,
											"rotationY": 172.9068150208623,
											"rotationZ": 8.012710924327613e-16,
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
														"texture": "Fx/Alphas/T_Circle_4.png"
													}
												},
												{
													"type": "shader",
													"name": "WorldUV",
													"source": "shaders/WorldUV.hx",
													"enabled": false,
													"props": {
														"useNormalMap": false,
														"onDecal": false,
														"scale": 1,
														"rotation": 210
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.08,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 1,
														"texture": "Fx/Gradients/cGrad.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.y",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6,
															"value": 1,
															"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.92,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/cGrad.png",
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
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"enabled": false,
											"props": {
												"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
												"directionalNoise": false,
												"intensity": 0.1,
												"scrollSpeed": [
													1,
													0
												],
												"scale": [
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7000378310214376,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7100378310214376,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8887343532684284,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3854370271122316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3954370271122314,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4262295081967213,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5056746532156369,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5208070617906684,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5510718789407316,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.309041614123582,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3190416141235817,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3493064312736447,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
									"type": "object",
									"name": "group",
									"x": -0.18393,
									"z": -0.03348,
									"children": [
										{
											"type": "polygon",
											"name": "trai",
											"z": 0.13685,
											"scaleX": 0.3,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationX": 89.99999999999999,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Gradients/Cyl15u_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
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
														"progress": 0.35,
														"saturation": 1,
														"width": 0.46,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
														"progress": 0.44,
														"saturation": 1,
														"width": 0.67,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/uGrad_inv.png",
														"uvShift": [
															0.015,
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
															"loop": true,
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
																		"dv": 0,
																		"dt": -0.3333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 5,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 0.5,
																	"mode": 0
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
														"threshold": 0.3,
														"useRGB": false
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "trai",
											"z": 0.07917,
											"scaleX": 0.3,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationX": 89.99999999999999,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Gradients/Cyl15u_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
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
														"progress": 0.35,
														"saturation": 1,
														"width": 0.46,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
														"useScale": false,
														"wrap": true,
														"progress": 0.44,
														"saturation": 1,
														"width": 0.67,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/uGrad_inv.png",
														"uvShift": [
															0.015,
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.008534843427752912,
																		"dt": -0.9971166174287185
																	},
																	"nextHandle": {
																		"dv": -0.008333333333333304,
																		"dt": 0.9777468706536854
																	}
																},
																{
																	"time": 6,
																	"value": 0.5,
																	"mode": 2
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
														"threshold": 0.3,
														"useRGB": false
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "trai",
											"z": 0.02113,
											"scaleX": 0.3,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationX": 89.99999999999999,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Gradients/Cyl15u_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
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
														"progress": 0.35,
														"saturation": 1,
														"width": 0.46,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
														"progress": 0.44,
														"saturation": 1,
														"width": 0.67,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/uGrad_inv.png",
														"uvShift": [
															0.015,
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.008534843427753014,
																		"dt": -1.956884561891516
																	},
																	"nextHandle": {
																		"dv": -0.0086378751176363,
																		"dt": 1.9986082630585182
																	}
																},
																{
																	"time": 6,
																	"value": 0.5,
																	"mode": 2
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
														"threshold": 0.3,
														"useRGB": false
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "trai",
											"z": -0.11001,
											"scaleX": 0.3,
											"scaleY": 0.2,
											"scaleZ": 0.3,
											"rotationX": 89.99999999999999,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Gradients/Cyl15u_A.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
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
														"progress": 0.35,
														"saturation": 1,
														"width": 0.46,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl15u_A.png",
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
														"progress": 0.44,
														"saturation": 1,
														"width": 0.67,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/uGrad_inv.png",
														"uvShift": [
															0.015,
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
															"loop": true,
															"keys": [
																{
																	"time": 2.994197670375522,
																	"value": 0.75,
																	"mode": 2
																},
																{
																	"time": 5.994197670375522,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.008534843427752912,
																		"dt": -0.9971166174287185
																	},
																	"nextHandle": {
																		"dv": -0.008333333333333304,
																		"dt": 0.9777468706536854
																	}
																},
																{
																	"time": 8.994197670375522,
																	"value": 0.75,
																	"mode": 2
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
														"threshold": 0.3,
														"useRGB": false
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
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.075,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8428372739916551,
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
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.36,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8887343532684284,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4262295081967213,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5056746532156369,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5208070617906684,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5510718789407316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.309041614123582,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3190416141235817,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3493064312736447,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"enabled": false,
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.05,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7666897856242118,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3854370271122316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3954370271122314,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4262295081967213,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5056746532156369,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5208070617906684,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5510718789407316,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.309041614123582,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3190416141235817,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.3493064312736447,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
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
					"type": "object",
					"name": "Drone02_appear",
					"enabled": false,
					"x": 7.05588,
					"y": 17.90281,
					"z": -1.2207,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": -2.6,
					"rotationY": 6.9,
					"rotationZ": 19,
					"children": [
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7
							},
							"y": -0.11891,
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
													"emissive": 5
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
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_512.png"
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Projector",
							"x": -0.0006500000000002615,
							"y": -0.047725000000000004,
							"z": -0.007139999999999924,
							"children": [
								{
									"type": "model",
									"name": "CylinderRayLarge",
									"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
									"x": 0.0006500000000002615,
									"y": 0.007725000000000003,
									"z": 0.007139999999999924,
									"scaleX": 0.1314176406557566,
									"scaleY": 0.14984858455343808,
									"scaleZ": 0.20005636454545858,
									"rotationX": -73.9324862263181,
									"rotationY": 5.391234066046365,
									"rotationZ": -0.1686975681151355,
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
													"emissive": 7,
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Lines.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.008,
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
												"progress": 0.24,
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
											"enabled": false,
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010709876543209974,
														"dt": -1.1801119638979403
													},
													"nextHandle": {
														"dv": -1.973261336877234e-17,
														"dt": 0.4700325662457744
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6696297968427336
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6696297968427336
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.02,
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
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003895847281944815,
														"dt": -0.5736389697421063
													},
													"nextHandle": {
														"dv": 0.00794789174374344,
														"dt": 0.9511111031496995
													}
												},
												{
													"time": 5,
													"value": 1.25,
													"mode": 0,
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
													"time": 10,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0014884568003692422,
														"dt": -1.009308251358501
													},
													"nextHandle": {
														"dv": -5.629970473646528e-17,
														"dt": 0.6385958961114322
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderRayLarge",
									"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
									"x": -0.0006499999999998174,
									"y": -0.007724999999999996,
									"z": -0.007140000000000035,
									"scaleX": 30,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationX": -89.99999999999999,
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
													"emissive": 7
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
												"alpha": 0.1,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Lines.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.008,
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
												"progress": 0.29,
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
											"enabled": false,
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.055632823365785816,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.08333333333333333
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										}
									]
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.4254587569927481,
														"dt": 0.06380771848396949
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
							"name": "UI_Window",
							"y": -1.09503,
							"z": -0.25731,
							"children": [
								{
									"type": "polygon",
									"name": "fond",
									"x": -0.00442,
									"z": -0.01959,
									"scaleX": 0.8,
									"scaleY": 0.85,
									"scaleZ": 0.8,
									"rotationX": 89.99999999999999,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_DroneUI_01.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 0.89,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Lines01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.41,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/Dust06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
												]
											}
										}
									]
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
											"keys": [
												{
													"time": 0.27125424685763166,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.6590417204688162,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "content",
									"x": -0.0069550000000000445,
									"z": -0.026534999999999975,
									"children": [
										{
											"type": "object",
											"name": "group",
											"x": -0.1769750000000001,
											"z": -0.006944999999999979,
											"children": [
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.13685,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
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
																				"dv": 0,
																				"dt": -0.3333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3333333333333333
																			}
																		},
																		{
																			"time": 5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 10,
																			"value": 0.5,
																			"mode": 0
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.07917,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"useScale": false,
																"wrap": true,
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427752912,
																				"dt": -0.9971166174287185
																			},
																			"nextHandle": {
																				"dv": -0.008333333333333304,
																				"dt": 0.9777468706536854
																			}
																		},
																		{
																			"time": 6,
																			"value": 0.5,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.02113,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427753014,
																				"dt": -1.956884561891516
																			},
																			"nextHandle": {
																				"dv": -0.0086378751176363,
																				"dt": 1.9986082630585182
																			}
																		},
																		{
																			"time": 6,
																			"value": 0.5,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": -0.11001,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"colorMask": 255
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 2.994197670375522,
																			"value": 0.75,
																			"mode": 2
																		},
																		{
																			"time": 5.994197670375522,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427752912,
																				"dt": -0.9971166174287185
																			},
																			"nextHandle": {
																				"dv": -0.008333333333333304,
																				"dt": 0.9777468706536854
																			}
																		},
																		{
																			"time": 8.994197670375522,
																			"value": 0.75,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4424266543734218,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06763037409379256,
																"dt": -0.49999681125499434
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.12303329276773298
															}
														},
														{
															"time": 0.8234834858111499,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "circles",
											"x": 0.1769750000000001,
											"z": 0.006944999999999979,
											"children": [
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.29999999999999993,
													"scaleY": 0.29999999999999993,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999997,
													"rotationY": 64.23011126564673,
													"rotationZ": -7.315691768701423e-15,
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
																	"emissive": 0.25
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 8,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.73,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.40000000000000013,
													"scaleY": 0.40000000000000013,
													"scaleZ": 0.40000000000000013,
													"rotationX": 89.99999999999997,
													"rotationY": -121.22988873435328,
													"rotationZ": -6.134463682916234e-15,
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
																	"emissive": 0.5
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 8,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.19999999999999998,
													"scaleY": 0.19999999999999998,
													"scaleZ": 0.2,
													"rotationX": 89.99999999999999,
													"rotationY": 172.9068150208623,
													"rotationZ": 8.012710924327613e-16,
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
																	"emissive": 0.5
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.09999999999999999,
													"scaleY": 0.09999999999999999,
													"scaleZ": 0.1,
													"rotationX": 89.99999999999999,
													"rotationY": 172.9068150208623,
													"rotationZ": 8.012710924327613e-16,
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "WorldUV",
															"source": "shaders/WorldUV.hx",
															"enabled": false,
															"props": {
																"useNormalMap": false,
																"onDecal": false,
																"scale": 1,
																"rotation": 210
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 1,
																	"mode": 2
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
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
														"directionalNoise": false,
														"intensity": 0.1,
														"scrollSpeed": [
															1,
															0
														],
														"scale": [
															1,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7000378310214376,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7100378310214376,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8887343532684284,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.4262295081967213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5056746532156369,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5208070617906684,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5510718789407316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.309041614123582,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3190416141235817,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3493064312736447,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.3532739916905382,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.06763037409379256,
																		"dt": -0.49999681125499434
																	},
																	"nextHandle": {
																		"dv": 0.016666666666666663,
																		"dt": 0.12303329276773298
																	}
																},
																{
																	"time": 0.7410614653017227,
																	"value": 1,
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
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.075,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8428372739916551,
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.27125424685763166,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.6590417204688162,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "border",
									"x": -0.0044200000000000905,
									"z": -0.019589999999999996,
									"scaleX": 1.15,
									"scaleY": 1.22,
									"scaleZ": 1.15,
									"rotationX": 89.99999999999999,
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_UI_Card_Pattern.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.08333333333333333
													}
												},
												{
													"time": 0.25,
													"value": 1,
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
					"type": "object",
					"name": "Drone02_appear",
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": -2.6,
					"rotationY": 6.9,
					"rotationZ": 19,
					"children": [
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Stars",
							"enabled": false,
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7
							},
							"y": -0.11891,
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
													"emissive": 5
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
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_512.png"
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Projector",
							"x": -0.0006500000000002615,
							"y": -0.047725000000000004,
							"z": -0.007139999999999924,
							"children": [
								{
									"type": "model",
									"name": "CylinderRayLarge",
									"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
									"x": 0.0006500000000002615,
									"y": 0.007725000000000003,
									"z": 0.007139999999999924,
									"scaleX": 0.1314176406557566,
									"scaleY": 0.14984858455343808,
									"scaleZ": 0.20005636454545858,
									"rotationX": -73.9324862263181,
									"rotationY": 5.391234066046365,
									"rotationZ": -0.1686975681151355,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 7,
													"depthTest": "LessEqual",
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
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Lines.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.008,
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
												"progress": 0.35,
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
											"enabled": false,
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010709876543209974,
														"dt": -1.1801119638979403
													},
													"nextHandle": {
														"dv": -1.973261336877234e-17,
														"dt": 0.4700325662457744
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.y",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6696297968427336
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6696297968427336
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.02,
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
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003895847281944815,
														"dt": -0.5736389697421063
													},
													"nextHandle": {
														"dv": 0.00794789174374344,
														"dt": 0.9511111031496995
													}
												},
												{
													"time": 5,
													"value": 1.25,
													"mode": 0,
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
													"time": 10,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0014884568003692422,
														"dt": -1.009308251358501
													},
													"nextHandle": {
														"dv": -5.629970473646528e-17,
														"dt": 0.6385958961114322
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderRayLarge",
									"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
									"x": -0.0006499999999998174,
									"y": -0.007724999999999996,
									"z": -0.007140000000000035,
									"scaleX": 30,
									"scaleY": 20,
									"scaleZ": 30,
									"rotationX": -89.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 7,
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
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Lines.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.008,
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
												"progress": 0.53,
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
											"enabled": false,
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.055632823365785816,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.08333333333333333
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										}
									]
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.4254587569927481,
														"dt": 0.06380771848396949
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
							"name": "UI_Window",
							"y": -1.09503,
							"z": -0.25731,
							"children": [
								{
									"type": "polygon",
									"name": "fond",
									"x": -0.00442,
									"z": -0.01959,
									"scaleX": 0.8,
									"scaleY": 0.85,
									"scaleZ": 0.8,
									"rotationX": 89.99999999999999,
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
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_DroneUI_01.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 0,
												"width": 0.89,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Lines01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.41,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/Dust06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
												]
											}
										}
									]
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
											"keys": [
												{
													"time": 0.27125424685763166,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.6590417204688162,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "content",
									"x": -0.0069550000000000445,
									"z": -0.026534999999999975,
									"children": [
										{
											"type": "object",
											"name": "group",
											"x": -0.1769750000000001,
											"z": -0.006944999999999979,
											"children": [
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.13685,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
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
																				"dv": 0,
																				"dt": -0.3333333333333333
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.3333333333333333
																			}
																		},
																		{
																			"time": 5,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 10,
																			"value": 0.5,
																			"mode": 0
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.07917,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"useScale": false,
																"wrap": true,
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427752912,
																				"dt": -0.9971166174287185
																			},
																			"nextHandle": {
																				"dv": -0.008333333333333304,
																				"dt": 0.9777468706536854
																			}
																		},
																		{
																			"time": 6,
																			"value": 0.5,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": 0.02113,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427753014,
																				"dt": -1.956884561891516
																			},
																			"nextHandle": {
																				"dv": -0.0086378751176363,
																				"dt": 1.9986082630585182
																			}
																		},
																		{
																			"time": 6,
																			"value": 0.5,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "trai",
													"z": -0.11001,
													"scaleX": 0.3,
													"scaleY": 0.2,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999999,
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
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
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
																"texture": "Fx/Gradients/Cyl15u_A.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
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
																"progress": 0.35,
																"saturation": 1,
																"width": 0.46,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl15u_A.png",
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
																"progress": 0.44,
																"saturation": 1,
																"width": 0.67,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	0.015,
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 2.994197670375522,
																			"value": 0.75,
																			"mode": 2
																		},
																		{
																			"time": 5.994197670375522,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.008534843427752912,
																				"dt": -0.9971166174287185
																			},
																			"nextHandle": {
																				"dv": -0.008333333333333304,
																				"dt": 0.9777468706536854
																			}
																		},
																		{
																			"time": 8.994197670375522,
																			"value": 0.75,
																			"mode": 2
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
																"threshold": 0.3,
																"useRGB": false
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4424266543734218,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06763037409379256,
																"dt": -0.49999681125499434
															},
															"nextHandle": {
																"dv": 0.016666666666666663,
																"dt": 0.12303329276773298
															}
														},
														{
															"time": 0.8234834858111499,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "circles",
											"x": 0.1769750000000001,
											"z": 0.006944999999999979,
											"children": [
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.29999999999999993,
													"scaleY": 0.29999999999999993,
													"scaleZ": 0.3,
													"rotationX": 89.99999999999997,
													"rotationY": 64.23011126564673,
													"rotationZ": -7.315691768701423e-15,
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
																	"emissive": 0.25,
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 8,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.73,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.40000000000000013,
													"scaleY": 0.40000000000000013,
													"scaleZ": 0.40000000000000013,
													"rotationX": 89.99999999999997,
													"rotationY": -121.22988873435328,
													"rotationZ": -6.134463682916234e-15,
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
																	"emissive": 0.5,
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 8,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.19999999999999998,
													"scaleY": 0.19999999999999998,
													"scaleZ": 0.2,
													"rotationX": 89.99999999999999,
													"rotationY": 172.9068150208623,
													"rotationZ": 8.012710924327613e-16,
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
																	"emissive": 0.5,
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "polygon",
													"name": "round",
													"scaleX": 0.09999999999999999,
													"scaleY": 0.09999999999999999,
													"scaleZ": 0.1,
													"rotationX": 89.99999999999999,
													"rotationY": 172.9068150208623,
													"rotationZ": 8.012710924327613e-16,
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
																"texture": "Fx/Alphas/T_Circle_4.png"
															}
														},
														{
															"type": "shader",
															"name": "WorldUV",
															"source": "shaders/WorldUV.hx",
															"enabled": false,
															"props": {
																"useNormalMap": false,
																"onDecal": false,
																"scale": 1,
																"rotation": 210
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": true,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.08,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 1,
																"texture": "Fx/Gradients/cGrad.png"
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 1.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.5,
																			"mode": 2
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 1,
																	"mode": 2
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
																"useScale": false,
																"wrap": true,
																"progress": 0.92,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/cGrad.png",
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
												},
												{
													"type": "shader",
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"enabled": false,
													"props": {
														"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
														"directionalNoise": false,
														"intensity": 0.1,
														"scrollSpeed": [
															1,
															0
														],
														"scale": [
															1,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7000378310214376,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7100378310214376,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8887343532684284,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3854370271122316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.3954370271122314,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.4262295081967213,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5056746532156369,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5208070617906684,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5510718789407316,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.309041614123582,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.3190416141235817,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3493064312736447,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.3532739916905382,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.06763037409379256,
																		"dt": -0.49999681125499434
																	},
																	"nextHandle": {
																		"dv": 0.016666666666666663,
																		"dt": 0.12303329276773298
																	}
																},
																{
																	"time": 0.7410614653017227,
																	"value": 1,
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
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/N_AnisotropicPixel.png",
										"directionalNoise": false,
										"intensity": 0.075,
										"scrollSpeed": [
											1,
											0
										],
										"scale": [
											2,
											2
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7000378310214376,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7100378310214376,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8428372739916551,
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.27125424685763166,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.6590417204688162,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "border",
									"x": -0.0044200000000000905,
									"z": -0.019589999999999996,
									"scaleX": 1.15,
									"scaleY": 1.22,
									"scaleZ": 1.15,
									"rotationX": 89.99999999999999,
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
												"texture": "Fx/Alphas/T_UI_Card_Pattern.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.08333333333333333
													}
												},
												{
													"time": 0.25,
													"value": 1,
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
					"type": "object",
					"name": "Drone03",
					"enabled": false,
					"x": -9.40753,
					"y": -0.11,
					"z": 7,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "model",
							"name": "DrisqDrone",
							"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqDrone.fbx",
							"enabled": false,
							"y": 0.10999999999999999,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"children": [
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
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
							"type": "emitter",
							"name": "Stars",
							"enabled": false,
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7
							},
							"y": -0.11891,
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
													"emissive": 5
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": -0.04,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.3,
							"rotationX": -53.1,
							"rotationY": 5.2,
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
											"emissive": 20
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.35,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
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
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"y": -0.04,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.3,
							"rotationX": -53.1,
							"rotationY": 5.2,
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
											"emissive": 20
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.23,
										"saturation": 0,
										"width": 1,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.9624288915861873,
											"mode": 0,
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
											"value": 0.9984643854133483,
											"mode": 0,
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
											"value": 0.49706424890473044,
											"mode": 0,
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
											"value": 0.9956866076355703,
											"mode": 0,
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
											"value": 0.4974899958893796,
											"mode": 0,
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
											"value": 0.9624288915861873,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
										"scale": 1,
										"power": 1,
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
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "hologram",
							"x": -0.06309,
							"y": -0.80202,
							"z": -0.66899,
							"children": [
								{
									"type": "model",
									"name": "Kraken",
									"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
									"enabled": false,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
											}
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": false,
												"scale": 0.25,
												"rotation": 0
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 20,
													"value": 1,
													"mode": 2
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl15u_A.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
												]
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"enabled": false,
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.02,
												"scale": 1,
												"power": 1,
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
									"name": "Kraken",
									"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
											}
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": false,
												"scale": 0.25,
												"rotation": 0
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 20,
													"value": 1,
													"mode": 2
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad01.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/Cyl15u_A.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
												]
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
												"bias": 0.02,
												"scale": 1,
												"power": 1,
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
									"name": "Kraken",
									"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
											}
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": true,
												"scale": 0.25,
												"rotation": 360
											},
											"children": [
												{
													"type": "curve",
													"name": "rotation",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3200,
															"value": 180,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 20,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
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
												"texture": "Fx/Alphas/Pointille.png"
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
												"bias": 0.02,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.63,
												"saturation": 1,
												"width": 0.89,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/Lines01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.41,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/Dust06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.1
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"enabled": false,
											"props": {
												"UVScale": [
													0.25,
													0.25
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.8392156862745098,
													0.803921568627451,
													1,
													1
												],
												"mask": "Fx/noise/NoisePurple_01.png",
												"UVOffset": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 20,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone04",
					"enabled": false,
					"x": -18.52266,
					"y": -0.11,
					"z": 7,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
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
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "DrisqDrone",
							"source": "Character/Smuggler/Weapon/DrisqWeaponSet/DrisqDrone.fbx",
							"enabled": false,
							"y": 0.10999999999999999,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"children": [
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
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
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7,
								"instStretch": [
									1,
									0.75,
									1
								]
							},
							"y": -0.11891,
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
													"emissive": 5
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
												"texture": "Fx/Alphas/T_Flare07_512.png"
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"enabled": false,
							"y": -0.04,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.3,
							"rotationX": -53.1,
							"rotationY": 5.2,
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
											"emissive": 20
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.35,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
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
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRaySquare_scan",
							"source": "Fx/Vehicle/Ornithopter/SquareRay05.fbx",
							"x": -0.0013000000000000789,
							"y": -0.05545,
							"z": -0.01427999999999996,
							"scaleX": 30,
							"scaleY": 10,
							"scaleZ": 30,
							"rotationX": -89.99999999999999,
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
											"emissive": 20
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
										"texture": "Fx/Alphas/T_ScanDrone01.png",
										"onDecal": false
									},
									"isInstance": true
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
										"alpha": 0.5,
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
										"progress": 0.29,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.56,
										"saturation": 1,
										"width": 0.61,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_ScanDrone01.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/Dust07.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.3
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
									"enabled": false,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 1
									}
								},
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"enabled": false,
									"props": {
										"useNormalMap": false,
										"onDecal": false,
										"scale": 0.2,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.3
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRaySquare",
							"source": "Fx/Vehicle/Ornithopter/SquareRay05.fbx",
							"x": -0.0013000000000000789,
							"y": -0.05545,
							"z": -0.01427999999999996,
							"scaleX": 30,
							"scaleY": 10,
							"scaleZ": 30,
							"rotationX": -89.99999999999999,
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
											"emissive": 20
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
										"alpha": 0.25,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.2,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 1
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"enabled": false,
							"y": -0.04,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.3,
							"rotationX": -53.1,
							"rotationY": 5.2,
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
											"emissive": 20
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
										"progress": 0.62,
										"saturation": 1,
										"width": 0.64,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.35,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
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
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRayLarge",
							"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
							"enabled": false,
							"y": -0.04,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.3,
							"rotationX": -53.1,
							"rotationY": 5.2,
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
											"emissive": 20
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.23,
										"saturation": 0,
										"width": 1,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": -0.003895847281944815,
												"dt": -0.5736389697421063
											},
											"nextHandle": {
												"dv": 0.00794789174374344,
												"dt": 0.9511111031496995
											}
										},
										{
											"time": 5,
											"value": 1.25,
											"mode": 0,
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
											"time": 10,
											"value": 0.8,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0014884568003692422,
												"dt": -1.009308251358501
											},
											"nextHandle": {
												"dv": -5.629970473646528e-17,
												"dt": 0.6385958961114322
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.9624288915861873,
											"mode": 0,
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
											"value": 0.9984643854133483,
											"mode": 0,
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
											"value": 0.49706424890473044,
											"mode": 0,
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
											"value": 0.9956866076355703,
											"mode": 0,
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
											"value": 0.4974899958893796,
											"mode": 0,
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
											"value": 0.9624288915861873,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6696297968427336
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6696297968427336
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": false,
										"bias": 0.02,
										"scale": 1,
										"power": 1,
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
							"name": "CylinderRaySquare2",
							"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
							"enabled": false,
							"x": -0.0013000000000000789,
							"y": -0.05545,
							"z": -0.01427999999999996,
							"scaleX": 30,
							"scaleY": 20,
							"scaleZ": 30,
							"rotationX": -89.99999999999999,
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
											"emissive": 20
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
										"alpha": 0.1,
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 5,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.29,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderRaySquare2",
							"source": "Fx/Vehicle/Ornithopter/SquareRay03.fbx",
							"enabled": false,
							"x": -0.0013000000000000789,
							"y": -0.05545,
							"z": -0.01427999999999996,
							"scaleX": 30,
							"scaleY": 20,
							"scaleZ": 30,
							"rotationX": -89.99999999999999,
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
											"emissive": 20
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
										"alpha": 0.1,
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
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.008,
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
										"progress": 0.29,
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Leto",
							"source": "Character/Atreide/Leader/Leto/Leto.fbx",
							"y": -0.97991,
							"z": -1.30081,
							"children": [
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "None",
											"shadows": false,
											"culling": "None",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Hair_Albedo.png",
									"normalMap": "Character/Atreide/Leader/Leto/Leto_Hair_Normal.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Hair_MetallicGlossAO.png",
									"materialName": "Hair",
									"children": [
										{
											"type": "anisotropy",
											"name": "anisotropy",
											"mode": "Texture",
											"intensity": 0.77,
											"direction": 90,
											"noiseIntensity": 0.19,
											"intensityFactor": 0.74,
											"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoIntensity.png",
											"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoAngle.png",
											"rotationOffset": 136.36
										},
										{
											"type": "specularColor",
											"name": "specularColor",
											"specular": 0.39,
											"specularTint": 0.47,
											"specularColorCustomValue": 16746544,
											"mode": "Flat"
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "None",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Body_Albedo.png",
									"normalMap": "Character/Atreide/Leader/Leto/Leto_Body_Normal.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Body_MetallicGlossAO.png",
									"materialName": "Leto",
									"children": [
										{
											"type": "specularColor",
											"name": "specularColor",
											"specular": 0.34,
											"specularTint": 1,
											"specularColorPath": "Character/Atreide/Leader/Leto/Leto_Body_SpecColor.png",
											"mode": "Texture"
										},
										{
											"type": "anisotropy",
											"name": "anisotropy",
											"mode": "Texture",
											"intensity": 0.78,
											"direction": 147.27,
											"intensityFactor": 0.35,
											"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoIntensity.png",
											"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoAngle.png",
											"rotationOffset": 68.18
										},
										{
											"type": "sss",
											"name": "sss",
											"props": {},
											"mainColor": 13503488,
											"nearColor": 16724261,
											"intensity": 0.1,
											"nearRatio": 1,
											"maxAmountPerLight": 0.1,
											"translucencyTexture": "Character/Atreide/Leader/Leto/Leto_Body_SSSThickness.png"
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Cornea_Albedo.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Cornea_MetallicGlossAO.png",
									"materialName": "Mat_Cornea"
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Grille",
							"y": -0.80815,
							"z": -0.01244,
							"scaleX": 0.6,
							"scaleY": 0.18,
							"scaleZ": 0.25,
							"rotationX": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 20,
							"renderMode": "BeforeTonemapping",
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
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 2,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pointille.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 2.5,
										"vScale": 0.5,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Grid.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.67,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/Pointille.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.82,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.79,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.31,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/T_Square03_1024.jpg.png",
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
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"value": -0.17588952627745486,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"value": -0.1759,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Grille",
							"enabled": false,
							"y": -0.80815,
							"z": -0.01244,
							"scaleX": 0.6,
							"scaleY": 0.18,
							"scaleZ": 0.25,
							"rotationX": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 20,
							"renderMode": "BeforeTonemapping",
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 2,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pointille.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 2.5,
										"vScale": 0.5,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Grid.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.67,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/Pointille.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.79,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.79,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/T_Square03_1024.jpg.png",
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
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"value": -0.17588952627745486,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"value": -0.1759,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drone05_appear",
					"enabled": false,
					"x": 0.33616,
					"y": 1.16441,
					"z": -0.32677,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"rotationX": 39.4,
					"rotationY": 16.8,
					"rotationZ": -165,
					"children": [
						{
							"type": "model",
							"name": "Leto",
							"source": "Character/Atreide/Leader/Leto/Leto.fbx",
							"enabled": false,
							"y": -0.9799099999999998,
							"z": -1.30081,
							"children": [
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "None",
											"shadows": false,
											"culling": "None",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Hair_Albedo.png",
									"normalMap": "Character/Atreide/Leader/Leto/Leto_Hair_Normal.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Hair_MetallicGlossAO.png",
									"materialName": "Hair",
									"children": [
										{
											"type": "anisotropy",
											"name": "anisotropy",
											"mode": "Texture",
											"intensity": 0.77,
											"direction": 90,
											"noiseIntensity": 0.19,
											"intensityFactor": 0.74,
											"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoIntensity.png",
											"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Hair_AnisoAngle.png",
											"rotationOffset": 136.36
										},
										{
											"type": "specularColor",
											"name": "specularColor",
											"specular": 0.39,
											"specularTint": 0.47,
											"specularColorCustomValue": 16746544,
											"mode": "Flat"
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "None",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Body_Albedo.png",
									"normalMap": "Character/Atreide/Leader/Leto/Leto_Body_Normal.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Body_MetallicGlossAO.png",
									"materialName": "Leto",
									"children": [
										{
											"type": "specularColor",
											"name": "specularColor",
											"specular": 0.34,
											"specularTint": 1,
											"specularColorPath": "Character/Atreide/Leader/Leto/Leto_Body_SpecColor.png",
											"mode": "Texture"
										},
										{
											"type": "anisotropy",
											"name": "anisotropy",
											"mode": "Texture",
											"intensity": 0.78,
											"direction": 147.27,
											"intensityFactor": 0.35,
											"noiseIntensityPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoIntensity.png",
											"noiseDirectionPath": "Character/Atreide/Leader/Leto/Leto_Body_AnisoAngle.png",
											"rotationOffset": 68.18
										},
										{
											"type": "sss",
											"name": "sss",
											"props": {},
											"mainColor": 13503488,
											"nearColor": 16724261,
											"intensity": 0.1,
											"nearRatio": 1,
											"maxAmountPerLight": 0.1,
											"translucencyTexture": "Character/Atreide/Leader/Leto/Leto_Body_SSSThickness.png"
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "Forward",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false
										}
									},
									"diffuseMap": "Character/Atreide/Leader/Leto/Leto_Cornea_Albedo.png",
									"specularMap": "Character/Atreide/Leader/Leto/Leto_Cornea_MetallicGlossAO.png",
									"materialName": "Mat_Cornea"
								}
							]
						},
						{
							"type": "object",
							"name": "Drone",
							"y": 0.08831,
							"scaleY": 0.7,
							"children": [
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": 45.00000000000001,
									"children": [
										{
											"type": "model",
											"name": "CubeNoVrtx",
											"source": "Fx/Meshes_Common/CubeNoVrtx.fbx",
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 0.8,
											"rotationZ": 45,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "PBR",
															"blend": "None",
															"shadows": false,
															"culling": "Back",
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false
														}
													}
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
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Stars",
							"props": {
								"lifeTime": 0.8,
								"emitRate": 2,
								"alignMode": "Screen",
								"instScale_rand": 0.05,
								"instScale": 0.7,
								"instStretch": [
									1,
									0.75,
									1
								]
							},
							"y": -0.11891,
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
													"emissive": 5
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
												"texture": "Fx/Alphas/T_Flare07_512.png"
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
															"mode": 0,
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
															"mode": 0,
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
													0.5568627450980392,
													0.4549019607843137,
													1
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 0.8,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0.05511018559878773,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.06511018559878773,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9280341866871185,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9380341866871182,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "ScanMesh",
							"x": -0.0013000000000000789,
							"y": -0.05545,
							"z": -0.01427999999999996,
							"children": [
								{
									"type": "model",
									"name": "CylinderRaySquare",
									"source": "Fx/Vehicle/Ornithopter/SquareRay05.fbx",
									"scaleX": 30,
									"scaleY": 10,
									"scaleZ": 30,
									"rotationX": -89.99999999999999,
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
													"emissive": 20
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
												"alpha": 0.25,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Lines.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.008,
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
												"progress": 0.2,
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010709876543209974,
														"dt": -1.1801119638979403
													},
													"nextHandle": {
														"dv": -1.973261336877234e-17,
														"dt": 0.4700325662457744
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											}
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderRaySquare_scan",
									"source": "Fx/Vehicle/Ornithopter/SquareRay05.fbx",
									"scaleX": 30,
									"scaleY": 10,
									"scaleZ": 30,
									"rotationX": -89.99999999999999,
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
													"emissive": 20
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
												"texture": "Fx/Alphas/T_ScanDrone01.png",
												"onDecal": false
											},
											"isInstance": true
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
												"alpha": 0.5,
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
												"progress": 0.29,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.56,
												"saturation": 1,
												"width": 0.61,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_ScanDrone01.png",
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_Scan_testVertical.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.3
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
													0.6549019607843137,
													0.5764705882352941,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
													"prevHandle": {
														"dv": -0.0010709876543209974,
														"dt": -1.1801119638979403
													},
													"nextHandle": {
														"dv": -1.973261336877234e-17,
														"dt": 0.4700325662457744
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 1
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.055632823365785816,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.08333333333333333
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.1370497042362304,
											"value": 1,
											"mode": 0
										},
										{
											"time": 2.3370497042362306,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.06666666666666672
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.06666666666666672
											}
										}
									]
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.4254587569927481,
														"dt": 0.06380771848396949
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.003884161548796894,
														"dt": 0.15501196371495707
													}
												},
												{
													"time": 2.1355176268606826,
													"value": 1,
													"mode": 0
												},
												{
													"time": 2.3359780937499037,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06682015562974038
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06682015562974038
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.35679879834533157,
											"value": 0,
											"mode": 0,
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
											"time": 1.1049949790080538,
											"value": 0.036035493827160495,
											"mode": 0,
											"prevHandle": {
												"dv": 0.004625928471171608,
												"dt": -0.5736380220516959
											},
											"nextHandle": {
												"dv": -0.002471385622563854,
												"dt": 0.22049872042271468
											}
										},
										{
											"time": 2.15670822725061,
											"value": -0.05302006172839509,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1633237446122722e-17,
												"dt": -0.9236824250221265
											},
											"nextHandle": {
												"dv": 6.938893903907228e-18,
												"dt": 1.0968728797137737
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.24328783901635198,
											"value": 0,
											"mode": 0,
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
											"time": 0.9914840196790742,
											"value": 0.036035493827160495,
											"mode": 0,
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
											"time": 2.4816106884899205,
											"value": -0.05302006172839509,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1633237446122722e-17,
												"dt": -0.9236824250221265
											},
											"nextHandle": {
												"dv": 6.938893903907228e-18,
												"dt": 1.0968728797137737
											}
										}
									],
									"children": [
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 1.000097056716123,
													"value": 0.05,
													"mode": 0,
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
													"time": 2.4530682523225655,
													"value": -0.05302006172839509,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1633237446122722e-17,
														"dt": -0.9236824250221265
													},
													"nextHandle": {
														"dv": 6.938893903907228e-18,
														"dt": 1.0968728797137737
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Grille",
							"y": -0.75417,
							"z": -0.01244,
							"scaleX": 0.6,
							"scaleY": 0.18,
							"scaleZ": 0.2,
							"rotationX": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 20,
							"renderMode": "BeforeTonemapping",
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
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/Pointille.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 2.5,
										"vScale": 0.5,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Grid.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.67,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Alphas/Pointille.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.82,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 0.82,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.79,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/Alphas/T_Scan_testVertical.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.31,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Gradients/T_Square03_1024.jpg.png",
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
									"type": "curve",
									"name": "position.z",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
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
											"value": -0.17588952627745486,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"value": -0.1759,
											"mode": 0,
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
											"value": 0.27,
											"mode": 0,
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
											"mode": 0,
											"prevHandle": {
												"dv": -0.0010709876543209974,
												"dt": -1.1801119638979403
											},
											"nextHandle": {
												"dv": -1.973261336877234e-17,
												"dt": 0.4700325662457744
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.34162857360379334,
											"value": 0,
											"mode": 0,
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
											"value": -0.17588952627745486,
											"mode": 0,
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
											"time": 2.155794102396351,
											"value": 0.27,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1633237446122722e-17,
												"dt": -0.9236824250221265
											},
											"nextHandle": {
												"dv": 6.938893903907228e-18,
												"dt": 1.0968728797137737
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
											0.6549019607843137,
											0.5764705882352941,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.055632823365785816,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.08333333333333333
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.1370497042362304,
											"value": 1,
											"mode": 0
										},
										{
											"time": 2.3370497042362306,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.06666666666666672
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.06666666666666672
											}
										}
									]
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.4254587569927481,
														"dt": 0.06380771848396949
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.055632823365785816,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06763037409379256,
														"dt": -0.49999681125499434
													},
													"nextHandle": {
														"dv": 0.016666666666666663,
														"dt": 0.12303329276773298
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.4166666666666665,
														"dt": -0.06253259735744088
													},
													"nextHandle": {
														"dv": -0.003884161548796894,
														"dt": 0.15501196371495707
													}
												},
												{
													"time": 2.1355176268606826,
													"value": 1,
													"mode": 0
												},
												{
													"time": 2.3359780937499037,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06682015562974038
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06682015562974038
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
			]
		}
	]
}