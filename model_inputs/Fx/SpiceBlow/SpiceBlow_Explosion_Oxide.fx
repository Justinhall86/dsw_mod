{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "reference",
			"name": "FX_PreviewScene",
			"source": "Fx/FX_PreviewScene.l3d",
			"x": 0.84,
			"y": 26.92,
			"z": -0.19,
			"scaleX": 10,
			"scaleY": 10,
			"scaleZ": 1.1
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "--------------------Spice",
					"props": {
						"tag": null
					},
					"children": [
						{
							"type": "reference",
							"name": "SpiceBlow",
							"source": "Environment/Asset/SpiceBlow/SpiceBlow.prefab",
							"z": 2.93,
							"scaleX": 35,
							"scaleY": 35,
							"rotationX": null,
							"rotationY": null,
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
											"time": 2.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5096026926171318,
											"value": 0.9629629629629629,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.h",
									"keys": [
										{
											"time": 3,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4,
											"value": 0.5961111111111111,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keys": [
										{
											"time": 3,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keys": [
										{
											"time": 3,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4,
											"value": 0.726619511710273,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.a",
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.026597900390626,
											"value": 0.5833333333333334,
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
					"name": "----------------------Pic",
					"x": -0.11399999999999999,
					"y": -0.014000000000000002,
					"scaleX": 1.5,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "emitter",
							"name": "Pic_Sand",
							"props": {
								"warmUpTime": -2.55,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 2
							},
							"x": 0.11399999999999999,
							"y": 0.014000000000000002,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes.fbx",
									"scaleX": 2.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationY": 90,
									"rotationZ": 90,
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
													"depthTest": "Less",
													"alphaKill": false
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.16862745098039217
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
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.5
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "scaleY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0733515669707474,
																"dt": -0.014636612276873899
															},
															"nextHandle": {
																"dv": 0.7333333333333333,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.09999999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.010909465819169345,
																"dt": -0.04663796637694913
															},
															"nextHandle": {
																"dv": 0.06666666666666676,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.43333333333333335,
																"dt": -0.05500000000000005
															},
															"nextHandle": {
																"dv": -1.6794498278120524,
																"dt": 0.21316093968383729
															}
														}
													]
												}
											],
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "fakeLight",
											"props": {},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.19,
											"topSpan": 0.15,
											"dirIntensity": 0.23,
											"dirSpan": 0.45,
											"sandBlend": 0.6,
											"envBlend": 0.5
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Pic_Violet",
							"props": {
								"warmUpTime": -2.55,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 2
							},
							"x": 0.11399999999999998,
							"y": 0.014,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes_2.fbx",
									"scaleX": 3,
									"rotationY": 90,
									"rotationZ": 90,
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
													"depthTest": "Less",
													"alphaKill": false
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "scaleY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0733515669707474,
																"dt": -0.014636612276873899
															},
															"nextHandle": {
																"dv": 0.7333333333333333,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.06999999999999999,
															"value": 0.9827777777777778,
															"mode": 0,
															"prevHandle": {
																"dv": -0.010909465819169345,
																"dt": -0.04663796637694913
															},
															"nextHandle": {
																"dv": 0.06666666666666676,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.43333333333333335,
																"dt": -0.05500000000000005
															},
															"nextHandle": {
																"dv": -1.6794498278120524,
																"dt": 0.21316093968383729
															}
														}
													]
												}
											],
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5490196078431373,
													0.32941176470588235,
													0.396078431372549
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
							"name": "Pic_Rose",
							"props": {
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 2
							},
							"x": 0.11399999999999999,
							"y": 0.014000000000000002,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes_2.fbx",
									"scaleX": 2,
									"rotationY": 90,
									"rotationZ": 110,
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
													"depthTest": "Less",
													"alphaKill": false,
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.2
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "scaleY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0733515669707474,
																"dt": -0.014636612276873899
															},
															"nextHandle": {
																"dv": 0.7333333333333333,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.06,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.010909465819169345,
																"dt": -0.04663796637694913
															},
															"nextHandle": {
																"dv": 0.06666666666666676,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.43333333333333335,
																"dt": -0.05500000000000005
															},
															"nextHandle": {
																"dv": -1.6794498278120524,
																"dt": 0.21316093968383729
															}
														}
													]
												}
											],
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9411764705882353,
													0.6431372549019607,
													0.050980392156862744
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
							"name": "Pic_Turquoise",
							"props": {
								"warmUpTime": -2.65,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 2
							},
							"x": -0.45599999999999996,
							"y": -0.05600000000000001,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes_2.fbx",
									"scaleX": 1.7,
									"rotationY": 90,
									"rotationZ": 100,
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
													"depthTest": "Less",
													"alphaKill": false,
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.2
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "scaleY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0733515669707474,
																"dt": -0.014636612276873899
															},
															"nextHandle": {
																"dv": 0.7333333333333333,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.065,
															"value": 0.9988888888888889,
															"mode": 0,
															"prevHandle": {
																"dv": -0.010909465819169345,
																"dt": -0.04663796637694913
															},
															"nextHandle": {
																"dv": 0.06666666666666676,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.43333333333333335,
																"dt": -0.05500000000000005
															},
															"nextHandle": {
																"dv": -1.6794498278120524,
																"dt": 0.21316093968383729
															}
														}
													]
												}
											],
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
													0.5568627450980392,
													0.2627450980392157
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
							"name": "Pic_Sand",
							"props": {
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"maxCount": 1,
								"instScale": 1.4,
								"lifeTime": 2
							},
							"x": 0.11399999999999999,
							"y": 0.014000000000000002,
							"rotationZ": -50.3,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes",
									"source": "Fx/Meshes_Common/CrossPlanes.fbx",
									"scaleX": 1.5,
									"rotationY": 90,
									"rotationZ": 100,
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
													"depthTest": "Less",
													"alphaKill": false,
													"emissive": 0.1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												0.8470588235294118,
												0.8470588235294118,
												0.8470588235294118,
												0.5882352941176471
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
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "scaleY",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0733515669707474,
																"dt": -0.014636612276873899
															},
															"nextHandle": {
																"dv": 0.7333333333333333,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 0.09999999999999999,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.010909465819169345,
																"dt": -0.04663796637694913
															},
															"nextHandle": {
																"dv": 0.06666666666666676,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.43333333333333335,
																"dt": -0.05500000000000005
															},
															"nextHandle": {
																"dv": -1.6794498278120524,
																"dt": 0.21316093968383729
															}
														}
													]
												}
											],
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "fakeLight",
											"props": {},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 1,
											"dirIntensity": 0.39,
											"dirSpan": 0.67,
											"sandBlend": 0.8,
											"envBlend": 0.5
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "-------------Anticipation",
					"x": -0.17666666666666667,
					"y": -0.2783333333333333,
					"z": 0.3333333333333333,
					"children": [
						{
							"type": "emitter",
							"name": "Vague",
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
									0.7019607843137254,
									0.7019607843137254,
									0.7019607843137254,
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
								"lifeTime": 2.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"useRandomColor": true,
								"instScale": 50,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"burstParticleCount": 2
							},
							"x": -0.43333333333333335,
							"y": -0.4816666666666667,
							"z": 0.16666666666666669,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.580392156862745
											]
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
																"dv": -0.4860055904056786,
																"dt": -0.14269951377868895
															},
															"nextHandle": {
																"dv": 0.7833333333333333,
																"dt": 0.22960269261712868
															}
														},
														{
															"time": 0.6396026926171298,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.1508327154525249
															},
															"nextHandle": {
																"dv": -0.07533246901372091,
																"dt": 0.6600302928514867
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 1,
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
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.3360659864267519,
																"dt": -0.49121460031686337
															},
															"nextHandle": {
																"dv": 0.3360659864267519,
																"dt": 0.49121460031686337
															}
														},
														{
															"time": 0.9846026926171307,
															"value": 0.9465210418844278,
															"mode": 0,
															"prevHandle": {
																"dv": 0.023323400779274084,
																"dt": -0.5500000000000016
															},
															"nextHandle": {
																"dv": -0.0045714724193943,
																"dt": 0.10780202486170407
															}
														}
													]
												}
											],
											"isInstance": true
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
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 1,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4196078431372549,
													0.3254901960784314,
													0.6588235294117647
												]
											},
											"isInstance": true
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
									"name": "instScale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.6996865745995167,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.016332927048989365,
												"dt": -0.756722543350623
											},
											"nextHandle": {
												"dv": 0.013610775649163569,
												"dt": 0.6300066376259388
											}
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Vague",
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
									0.7019607843137254,
									0.7019607843137254,
									0.7019607843137254,
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
								"lifeTime": 2.1,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"useRandomColor": true,
								"instScale": 15,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -0.3
							},
							"x": -0.2733333333333333,
							"y": -0.6316666666666667,
							"z": 0.26666666666666666,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												1,
												1,
												0.580392156862745
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.7
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
																"dv": -0.4860055904056786,
																"dt": -0.14269951377868895
															},
															"nextHandle": {
																"dv": 0.7833333333333333,
																"dt": 0.22960269261712868
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.1508327154525249
															},
															"nextHandle": {
																"dv": -0.07533246901372091,
																"dt": 0.6600302928514867
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"enabled": false,
											"props": {
												"REVERSE": false,
												"range": 1,
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
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.002623017324159328,
															"value": 0.06569753570028236,
															"mode": 0,
															"prevHandle": {
																"dv": -0.17614383984981913,
																"dt": -0.509939605906859
															},
															"nextHandle": {
																"dv": 0.20552548477630062,
																"dt": 0.5969796752929702
															}
														},
														{
															"time": 0.9846026926171307,
															"value": 0.9465210418844278,
															"mode": 0,
															"prevHandle": {
																"dv": -0.38169018601312965,
																"dt": -0.22000000000000064
															},
															"nextHandle": {
																"dv": 0.16251680340162686,
																"dt": 0.09367203574662543
															}
														}
													]
												}
											],
											"isInstance": true
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
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 1,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.24705882352941178,
													0.803921568627451,
													0.9333333333333333
												]
											},
											"isInstance": true
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.8793487721384007,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.016332927048989365,
												"dt": -0.756722543350623
											},
											"nextHandle": {
												"dv": 0.013610775649163569,
												"dt": 0.6300066376259388
											}
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Dust Blue",
							"props": {
								"instScale_rand": 10,
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
									0.6235294117647059,
									0.6235294117647059,
									0.6235294117647059,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"lifeTime": 8,
								"lifeTimeRand": 2,
								"emitType": "Burst",
								"burstCount": 7,
								"burstDelay": 0.2,
								"useRandomColor": true,
								"instScale": 20,
								"warmUpTime": -0.5,
								"burstParticleCount": 2,
								"alignMode": "Screen"
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": -0.3333333333333333,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"color": 872415231,
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
													"emissive": 4
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
												"alpha": 1
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
																"dv": -1.6025399127347053,
																"dt": -0.13736056394868915
															},
															"nextHandle": {
																"dv": 0.23333333333333334,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.09999999999999999,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.02076439710376039,
																"dt": -0.03444447048976718
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.4699999999999999
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3498306274414062,
															"mode": 0,
															"prevHandle": {
																"dv": 0.34528353621197455,
																"dt": -0.4602148641995827
															},
															"nextHandle": {
																"dv": -0.34528353621197455,
																"dt": 0.4602148641995827
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483109975988127,
																"dt": -0.4835372686313232
															},
															"nextHandle": {
																"dv": -0.5,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
											],
											"isInstance": true
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
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.5,
												"color": [
													0.3333333333333333,
													0.5098039215686274,
													0.7137254901960784
												]
											},
											"isInstance": true
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.4260541118472685,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 1.0883207428747863,
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
							],
							"enabled": false
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
								"lifeTime": 1.5,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"instScale": 30,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"speedFactor": 0.5
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": 0.1166666666666667,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 1,
									"args": [
										15,
										360,
										0,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.1
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
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
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
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
												"progress": 0.48,
												"saturation": 0,
												"width": 0.92,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/bluenoise_raw.png",
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
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3383333333333333
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
											],
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
											"time": 0,
											"value": 0,
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
											"value": 0.8381552269664314,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02797092125097078,
												"dt": -0.385
											},
											"nextHandle": {
												"dv": 0.02418463748949856,
												"dt": 0.33288447491281076
											}
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Distort_Revert",
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
								"instScale": 25,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -1.5
							},
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": 0.1166666666666667,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"kind": 1,
									"args": [
										15,
										360,
										0,
										4
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Add",
													"shadows": false,
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.05
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": -0.01235353535353545,
															"mode": 2
														},
														{
															"time": 0.03884502701146505,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06712041131603325,
																"dt": -0.02527739166268755
															},
															"nextHandle": {
																"dv": -0.5310707070707071,
																"dt": 0.20075766560566366
															}
														},
														{
															"time": 1,
															"value": 0,
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
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
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
												"progress": 0.69,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/bluenoise_raw.png",
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
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.15381774339106308,
																"dt": -0.4993438317382942
															},
															"nextHandle": {
																"dv": 0.06666666666666665,
																"dt": 0.21642229334959104
															}
														},
														{
															"time": 0.5096026926171294,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 0.12399640608263467,
																"dt": -0.12253762483460386
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.2800000000000007
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.6166666666666667,
																"dt": -0.2508459076360311
															},
															"nextHandle": {
																"dv": -0.8238379005043205,
																"dt": 0.33361164032829815
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": -0.0027746447865332168,
															"value": -0.06666666666666667,
															"mode": 2
														},
														{
															"time": 0.1359575945401277,
															"value": 0.9666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.022197158292265744
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.022197158292265744
															}
														}
													]
												}
											],
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
											"time": 0.0027746447865332202,
											"value": 0.9606914938954996,
											"mode": 0,
											"prevHandle": {
												"dv": 1.3298698452638637e-16,
												"dt": -0.341515025625114
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3422253552134668
											}
										},
										{
											"time": 1,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": 0.2924886640373511,
												"dt": -0.29500000000000004
											},
											"nextHandle": {
												"dv": -0.2924886640373511,
												"dt": 0.29500000000000004
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SemiSphere",
							"source": "Fx/Meshes_Common/SemiSphere.fbx",
							"x": 0.17666666666666667,
							"y": 0.2783333333333333,
							"z": -0.3333333333333333,
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
											"depthTest": "Less"
										}
									},
									"diffuseMap": "Fx/Gradients/circGrad05.jpg"
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
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceBlow_Albedo.png"
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
											0.3607843137254902,
											0.24313725490196078,
											0.580392156862745
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
										"progress": 0.53,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8146026926171301,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4496026926171317,
													"value": 0.6499999999999992,
													"mode": 2
												},
												{
													"time": 2.22,
													"value": 0.8833333333333333,
													"mode": 2
												},
												{
													"time": 2.7846026926171352,
													"value": 0.2594444444444444,
													"mode": 2
												},
												{
													"time": 3.9941285521346694,
													"value": 0.0011111111111110628,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0
										},
										{
											"time": 2.3346026926171337,
											"value": 0.16666666666666669,
											"mode": 2
										},
										{
											"time": 2.6396026926171348,
											"value": 5.551115123125783e-17,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04623627006965758,
												"dt": -0.0731250000000001
											},
											"nextHandle": {
												"dv": 0.09998413501702996,
												"dt": 0.15812996727688813
											}
										},
										{
											"time": 6,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0,
										"envColorSet": false
									},
									"isInstance": true
								}
							],
							"enabled": false
						}
					]
				},
				{
					"type": "object",
					"name": "------------------Decals",
					"x": -0.05666666666666667,
					"y": 0.023333333333333334,
					"z": 0.6666666666666666,
					"children": [
						{
							"type": "emitter",
							"name": "Decal_Sand_Violet",
							"props": {
								"lifeTime": 13,
								"warmUpTime": -2.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 45,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"seedGroup": 23
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": -0.6666666666666666,
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
												"texture": "Fx/Alphas/T_SandDecal_02.png"
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7058823529411764,
													0.44313725490196076,
													0.2980392156862745
												]
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
											"time": -0.005246447865332172,
											"value": -0.03333333333333333,
											"mode": 2
										},
										{
											"time": 0.05,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03508214928844406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03508214928844406
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Decal_Sand",
							"props": {
								"lifeTime": 15,
								"warmUpTime": -2.55,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 50,
								"instRotation_rand": [
									0,
									0,
									180
								]
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": 0.5,
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
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SandDecal_02.png"
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "fakeLight",
											"props": {},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 1,
											"dirIntensity": 0.43,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
											"time": -0.005246447865332172,
											"value": -0.03333333333333333,
											"mode": 2
										},
										{
											"time": 0.013938613842716968,
											"value": 1.0333333333333334,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03508214928844406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03508214928844406
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Decal_Turquoise",
							"props": {
								"lifeTime": 5,
								"warmUpTime": -2.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 20,
								"instRotation": [
									0,
									0,
									180
								]
							},
							"x": -0.2833333333333333,
							"y": 0.11666666666666668,
							"z": -0.36666666666666664,
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
												"texture": "Fx/Alphas/T_SandDecal_01.png"
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9254901960784314,
													0.6431372549019607,
													0.2627450980392157
												]
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
											"time": -0.005246447865332172,
											"value": -0.03333333333333333,
											"mode": 2
										},
										{
											"time": 0.024595049483169804,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03508214928844406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03508214928844406
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Decal_Violet",
							"props": {
								"lifeTime": 8,
								"warmUpTime": -2.5,
								"emitType": "Burst",
								"burstDelay": 0.1,
								"instScale": 50,
								"instRotation": [
									0,
									0,
									180
								]
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": -0.36666666666666664,
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
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SandDecal_01.png"
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
													0.8470588235294118,
													0.5725490196078431,
													0.3137254901960784
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
												"progress": 0.51,
												"saturation": 0,
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
													0
												],
												"uvScaleSpeed": [
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3333333333333333
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
											"time": -0.005246447865332172,
											"value": -0.03333333333333333,
											"mode": 2
										},
										{
											"time": 0.026371122089911936,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.03508214928844406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.03508214928844406
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 4,
								"warmUpTime": -2.5,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 30,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									2,
									0,
									0
								],
								"instAcceleration": [
									3,
									0,
									0
								]
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": 0.8333333333333334,
							"scaleX": 35,
							"scaleY": 35,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
																"dt": 0.0691666666666667
															}
														},
														{
															"time": 0.20250000000000007,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5647058823529412,
													0.5647058823529412,
													0.5647058823529412
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Big",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 4,
								"warmUpTime": -2.35,
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 50,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 1,
								"useRandomColor": true,
								"instStretch_rand": [
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
									1,
									0,
									0
								]
							},
							"x": 0.05666666666666667,
							"y": -0.023333333333333334,
							"z": 0.8333333333333334,
							"scaleX": 80,
							"scaleY": 80,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
																"dt": 0.0691666666666667
															}
														},
														{
															"time": 0.20250000000000007,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5647058823529412,
													0.5647058823529412,
													0.5647058823529412
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/perlin1.jpg",
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
																"dv": 1.5774945079565075,
																"dt": -0.4125041723638353
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.25640641691915195
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
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
					"name": "--------SandDirectional",
					"z": -0.25,
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Directional_Right",
							"props": {
								"instScale_rand": 1,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7686274509803921,
									0.7686274509803921,
									0.7686274509803921,
									0.38823529411764707
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									40
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
								"lifeTime": 5,
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"burstParticleCount": 4,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 12,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0.1,
									0.5,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"instStretch": [
									0.7,
									2.5,
									1
								],
								"instRotation": [
									0,
									0,
									45
								]
							},
							"z": 0.25,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
												"alpha": 1
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
																"dv": -4.993860516896712,
																"dt": -0.17285267941367816
															},
															"nextHandle": {
																"dv": 0.6227777777777779,
																"dt": 0.02146143768259108
															}
														},
														{
															"time": 0.0907493209055149,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.061589229531487835
															},
															"nextHandle": {
																"dv": -7.205007874764642e-16,
																"dt": 0.2763687163775504
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
											"time": 0.06457389835463255,
											"value": 1.3721211861460683,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.039234286208135856
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.29076571379186417
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Sand_Violet_Directional_Left",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									0.8901960784313725,
									0.8901960784313725,
									0.8901960784313725,
									1
								],
								"randomColor2": [
									0.5490196078431373,
									0.5490196078431373,
									0.5490196078431373,
									0.9686274509803922
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									20
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
								"lifeTime": 5,
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"burstParticleCount": 4,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 15,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0.1,
									0.5,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch": [
									0.5,
									2.5,
									1
								],
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"z": 0.25,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											},
											"isInstance": true
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
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -5.009036482277083,
																"dt": -0.16893237680338338
															},
															"nextHandle": {
																"dv": 0.6391666666666667,
																"dt": 0.02146143768259108
															}
														},
														{
															"time": 0.09536851312037646,
															"value": 0.9669444444444445,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.061589229531487835
															},
															"nextHandle": {
																"dv": -7.205007874764642e-16,
																"dt": 0.2763687163775504
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.596078431372549,
													0.37254901960784315
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
												"range": 5,
												"power": 0.5
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
											"time": 0.05533551392490939,
											"value": 1.3770711066293098,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.039234286208135856
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.29076571379186417
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Violet_Directional_Right",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									0.8,
									0.8,
									0.8,
									1
								],
								"randomColor2": [
									0.5490196078431373,
									0.5490196078431373,
									0.5490196078431373,
									0.9686274509803922
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									20
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
								"lifeTime": 5,
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"burstParticleCount": 4,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 15,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0.1,
									0.5,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"instStretch": [
									0.5,
									2.5,
									1
								],
								"instRotation": [
									0,
									0,
									45
								]
							},
							"z": -0.75,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
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
																"dv": -5.009036482277083,
																"dt": -0.16893237680338338
															},
															"nextHandle": {
																"dv": 0.6391666666666667,
																"dt": 0.02146143768259108
															}
														},
														{
															"time": 0.09536851312037646,
															"value": 0.9669444444444445,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.061589229531487835
															},
															"nextHandle": {
																"dv": -7.205007874764642e-16,
																"dt": 0.2763687163775504
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6509803921568628,
													0.37254901960784315
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
												"range": 5,
												"power": 0.5
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
											"time": 0.05533551392490939,
											"value": 1.3770711066293098,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.039234286208135856
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.29076571379186417
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Directional_Left",
							"props": {
								"instScale_rand": 1,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7686274509803921,
									0.7686274509803921,
									0.7686274509803921,
									0.38823529411764707
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									40
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Grunge_4x4_02.png",
								"lifeTime": 5,
								"warmUpTime": -2.6,
								"emitType": "Burst",
								"burstParticleCount": 4,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 12,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0.1,
									0.5,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"alignMode": "Screen",
								"useRandomColor": true,
								"instStretch": [
									0.7,
									2.5,
									1
								],
								"instRotation": [
									0,
									0,
									-45
								]
							},
							"z": 0.25,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
												"alpha": 1
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
																"dv": -4.993860516896712,
																"dt": -0.17285267941367816
															},
															"nextHandle": {
																"dv": 0.6227777777777779,
																"dt": 0.02146143768259108
															}
														},
														{
															"time": 0.0907493209055149,
															"value": 0.9833333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.061589229531487835
															},
															"nextHandle": {
																"dv": -7.205007874764642e-16,
																"dt": 0.2763687163775504
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.2,
												"sandColorSet": false,
												"envBlend": 0,
												"envColorSet": false
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
											"time": 0.06457389835463255,
											"value": 1.3721211861460683,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.039234286208135856
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.29076571379186417
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							],
							"enabled": false
						}
					]
				},
				{
					"type": "object",
					"name": "-------------LateEffects",
					"x": -0.35000000000000003,
					"z": 13.571428571428571,
					"children": [
						{
							"type": "emitter",
							"name": "Cloud_Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7294117647058823,
									0.7294117647058823,
									0.7294117647058823,
									0.9490196078431372
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Liquid_4x4_01.png",
								"lifeTime": 7,
								"warmUpTime": -2.55,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 30,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									1
								],
								"instAcceleration": [
									0,
									0,
									-3
								],
								"alignMode": "Screen",
								"useRandomColor": true
							},
							"x": 0.35,
							"z": 8.91,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 0.38,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
																"dv": -7.319578511031249,
																"dt": -0.12936804261204196
															},
															"nextHandle": {
																"dv": 0.9177777777777778,
																"dt": 0.015733385882543124
															}
														},
														{
															"time": 0.12495499896664104,
															"value": 0.9669444444444445,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8470588235294118,
													0.8470588235294118,
													0.8470588235294118
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/perlin06.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Cloud_Sand",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7411764705882353,
									0.7411764705882353,
									0.7411764705882353,
									0.9490196078431372
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Liquid_4x4_01.png",
								"lifeTime": 10,
								"warmUpTime": -3.4,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 30,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.5
								],
								"instAcceleration": [
									0,
									0,
									-1.5
								],
								"alignMode": "Screen",
								"useRandomColor": true
							},
							"x": 0.35,
							"z": 1.43,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 0.38,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
																"dv": -2.605960865619585,
																"dt": -0.6661865615596155
															},
															"nextHandle": {
																"dv": 0.5962824074074075,
																"dt": 0.15233855043700267
															}
														},
														{
															"time": 0.46182442883272906,
															"value": 0.934712962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.07544680617607258
															},
															"nextHandle": {
																"dv": -7.078129198573572e-16,
																"dt": 0.27610364877740373
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5647058823529412,
													0.5647058823529412,
													0.5647058823529412
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/perlin06.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Cloud_Sand_Violet",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7294117647058823,
									0.7294117647058823,
									0.7294117647058823,
									0.9490196078431372
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 10,
								"warmUpTime": -2.65,
								"emitType": "Burst",
								"burstParticleCount": 7,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.2
								],
								"instAcceleration": [
									0,
									0,
									-0.7
								],
								"alignMode": "Screen",
								"useRandomColor": true
							},
							"x": -2.1,
							"z": -1.48,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
																"dv": -7.319578511031249,
																"dt": -0.12936804261204196
															},
															"nextHandle": {
																"dv": 0.9177777777777778,
																"dt": 0.015733385882543124
															}
														},
														{
															"time": 0.12495499896664104,
															"value": 0.9669444444444445,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
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
													0.5647058823529412,
													0.5647058823529412,
													0.5647058823529412
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8509803921568627,
													0.5333333333333333,
													0.4196078431372549
												]
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Cloud_Sand_Turquoise ",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									1,
									1,
									1,
									0.9490196078431372
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 10,
								"warmUpTime": -2.65,
								"emitType": "Burst",
								"burstParticleCount": 5,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.2
								],
								"instAcceleration": [
									0,
									0,
									-0.5
								],
								"alignMode": "Screen"
							},
							"x": 0.35,
							"z": -4.09,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
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
													"emissive": 2
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.3
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
																"dv": -7.319578511031249,
																"dt": -0.12936804261204196
															},
															"nextHandle": {
																"dv": 0.9177777777777778,
																"dt": 0.015733385882543124
															}
														},
														{
															"time": 0.12495499896664104,
															"value": 0.9669444444444445,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5647058823529412,
													0.5647058823529412,
													0.5647058823529412
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9176470588235294,
													0.592156862745098,
													0.2823529411764706
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0.3333333333333333,
															"mode": 2
														},
														{
															"time": 0.9849999999999999,
															"value": 0.5666666666666667,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keys": [
														{
															"time": 0,
															"value": 0.09999999999999998,
															"mode": 2
														},
														{
															"time": 0.9849999999999999,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keys": [
														{
															"time": 0,
															"value": 0.7373046875000004,
															"mode": 2
														},
														{
															"time": 0.99,
															"value": 0.243421548604965,
															"mode": 2
														}
													]
												}
											],
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Cloud_Sand_Violet",
							"props": {
								"instScale_rand": 3,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.7058823529411764,
									0.7058823529411764,
									0.7058823529411764,
									0.9490196078431372
								],
								"emitRate": 1,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"lifeTime": 10,
								"warmUpTime": -3.4,
								"emitType": "Burst",
								"burstParticleCount": 10,
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.73,
								"emitRad2": 0.73,
								"emitSurface": true,
								"instScale": 20,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"instStartSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 5,
								"instStretch_rand": [
									0,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0.05
								],
								"instAcceleration": [
									0,
									0,
									-0.1
								],
								"alignMode": "Screen",
								"useRandomColor": true
							},
							"x": 0.35,
							"z": -4.93,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 0.38,
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
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												1,
												1,
												1,
												0.12941176470588234
											]
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
																"dv": -2.106716002441871,
																"dt": -0.6821153640926553
															},
															"nextHandle": {
																"dv": 0.5801666666666667,
																"dt": 0.1877523574176082
															}
														},
														{
															"time": 0.45720523661786744,
															"value": 0.934712962962963,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07562525672400151,
																"dt": -0.02399211269568948
															},
															"nextHandle": {
																"dv": -0.8333333333333334,
																"dt": 0.2643750000000001
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8745098039215686,
													0.5372549019607843,
													0.3137254901960784
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.5,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 0.5
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"sandBlend": 0.8,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9333333333333333,
													0.6588235294117647,
													0.34901960784313724
												]
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
											"value": 1.0899757186013024,
											"mode": 0,
											"prevHandle": {
												"dv": -0.10685270825476992,
												"dt": -0.08805109354652937
											},
											"nextHandle": {
												"dv": 0.38204884426652885,
												"dt": 0.31357142857142856
											}
										},
										{
											"time": 1,
											"value": 1.3869709475957928,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust_Violet_Late",
							"props": {
								"instScale_rand": 5,
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
									1,
									1,
									1,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"lifeTime": 15,
								"lifeTimeRand": 2,
								"emitType": "Burst",
								"burstDelay": 0.2,
								"instScale": 25,
								"warmUpTime": -2.5,
								"burstParticleCount": 10,
								"alignMode": "Screen",
								"instAcceleration": [
									0,
									0,
									-0.25
								],
								"instAcceleration_rand": [
									0,
									0,
									0.05
								]
							},
							"x": 0.35,
							"z": -4.41,
							"scaleX": 13,
							"scaleY": 13,
							"scaleZ": 25,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"color": 872415231,
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
													"emissive": 6
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
																"dv": -1.633879451956877,
																"dt": -0.13417250212447154
															},
															"nextHandle": {
																"dv": 0.75,
																"dt": 0.061494436878058154
															}
														},
														{
															"time": 0.24767857142857141,
															"value": 0.6545454545454545,
															"mode": 0,
															"prevHandle": {
																"dv": 0.02076439710376039,
																"dt": -0.03444447048976718
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.4699999999999999
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
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
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3498306274414062,
															"mode": 0,
															"prevHandle": {
																"dv": 0.34528353621197455,
																"dt": -0.4602148641995827
															},
															"nextHandle": {
																"dv": -0.34528353621197455,
																"dt": 0.4602148641995827
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483109975988127,
																"dt": -0.4835372686313232
															},
															"nextHandle": {
																"dv": -0.5,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
											],
											"isInstance": true
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.807843137254902,
													0.44313725490196076,
													0.09803921568627451
												]
											},
											"isInstance": true
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 0.7,
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
							],
							"enabled": false
						},
						{
							"type": "emitter",
							"name": "Dust_Blue_Late",
							"props": {
								"instScale_rand": 5,
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
									0.596078431372549,
									0.596078431372549,
									0.596078431372549,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 10,
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"lifeTime": 15,
								"lifeTimeRand": 2,
								"emitType": "Burst",
								"burstDelay": 0.2,
								"useRandomColor": true,
								"instScale": 25,
								"warmUpTime": -2.5,
								"burstParticleCount": 10,
								"alignMode": "Screen",
								"instAcceleration": [
									0,
									0,
									-0.25
								],
								"instAcceleration_rand": [
									0,
									0,
									0.05
								]
							},
							"x": 0.35,
							"z": -4.41,
							"scaleX": 9,
							"scaleY": 9,
							"scaleZ": 25,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"color": 872415231,
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
													"emissive": 6
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.5
											},
											"isInstance": true
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
																"dv": -1.633879451956877,
																"dt": -0.13417250212447154
															},
															"nextHandle": {
																"dv": 0.75,
																"dt": 0.061494436878058154
															}
														},
														{
															"time": 0.21546751070677772,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.02076439710376039,
																"dt": -0.03444447048976718
															},
															"nextHandle": {
																"dv": -0.2833333333333333,
																"dt": 0.4699999999999999
															}
														},
														{
															"time": 0.95,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
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
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.3498306274414062,
															"mode": 0,
															"prevHandle": {
																"dv": 0.34528353621197455,
																"dt": -0.4602148641995827
															},
															"nextHandle": {
																"dv": -0.34528353621197455,
																"dt": 0.4602148641995827
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8483109975988127,
																"dt": -0.4835372686313232
															},
															"nextHandle": {
																"dv": -0.5,
																"dt": 0.28500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
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
											],
											"isInstance": true
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
											"topIntensity": 0.73,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 0.5,
											"envColorSet": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.5,
												"color": [
													0.5215686274509804,
													0.3411764705882353,
													0.2392156862745098
												]
											},
											"isInstance": true
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0271089389830641,
												"dt": -0.06
											},
											"nextHandle": {
												"dv": 0.0271089389830641,
												"dt": 0.06
											}
										},
										{
											"time": 1,
											"value": 0.7,
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
				},
				{
					"type": "object",
					"name": "-----------------Distort",
					"z": 1,
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
								"lifeTime": 0.6,
								"emitType": "Burst",
								"burstDelay": 0.3,
								"useRandomColor": true,
								"instScale": 1.5,
								"emitShape": "Cylinder",
								"emitSurface": true,
								"warmUpTime": -2.45
							},
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Ring",
									"source": "Fx/Meshes_Common/Ring.fbx",
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
													"culling": "None"
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.02
											},
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
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.5,
												"scaleY": 0.5,
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
												"progress": 0.48,
												"saturation": 0,
												"width": 0.92,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/bluenoise_raw.png",
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
											],
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
											"time": 0,
											"value": 0.5,
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
				}
			]
		}
	]
}