{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXGroup",
			"x": 0.887445,
			"y": 0.791415,
			"z": 2.0684,
			"children": [
				{
					"type": "model",
					"name": "SM_GodRayPlane01",
					"source": "Fx/UI/SM_GodRayPlane01.fbx",
					"x": -0.35706,
					"y": -1.02194,
					"z": 0.54112,
					"scaleX": 61.01,
					"scaleY": 79,
					"rotationX": -62.999999999999986,
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
									"textureWrap": true,
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
								"uScale": 3,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/RaysDissolve_02_1024.png"
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
								"alpha": 0.62,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03_1024.jpg.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 1.0344759055361583,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4501948171369374,
											"value": 1,
											"mode": 2
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
								"shiftSpeedX": 0.01,
								"shiftSpeedY": 0,
								"USE_SOURCE_UV": true
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
								"progress": 0.3,
								"saturation": 0.65,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/RaysDissolve_09_1024.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.03,
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
								"width": 0.64,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/dGrad04.png",
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
							"name": "ColorMap",
							"source": "shaders/ColorMap.hx",
							"props": {
								"USE_ALPHA": true,
								"colorA": [
									0.9098039215686274,
									0.8470588235294118,
									0.611764705882353
								],
								"pointA": 0.75,
								"colorB": [
									0.8313725490196078,
									0.6078431372549019,
									0.16862745098039217
								],
								"pointB": 0
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.01,
						"instScale_rand": 0.002,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.01
						],
						"warmUpTime": 10,
						"emitRate": 20,
						"maxCount": 100,
						"useRandomColor": true,
						"randomColor1": [
							0.8549019607843137,
							0.6196078431372549,
							0.3137254901960784,
							1
						],
						"randomColor2": [
							0.8941176470588235,
							0.6745098039215687,
							0.3607843137254902,
							0.6941176470588235
						],
						"instSpeed": [
							0,
							0,
							-0.02
						]
					},
					"x": 0.03904,
					"y": 1.1314,
					"z": -0.31897,
					"scaleX": 1.4199999999999997,
					"scaleY": 2.29,
					"scaleZ": 2.05,
					"rotationY": 37.9,
					"rotationZ": -89.2,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1
										}
									},
									"color": [
										0.38431372549019605,
										0.4117647058823529,
										0.26666666666666666,
										1
									]
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
										"alpha": 0.9,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle.png"
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
														"dt": 0.16666666666666666
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
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
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
							"name": "emitRate",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Dust",
					"props": {
						"lifeTime": 8,
						"lifeTimeRand": 5,
						"emitShape": "Box",
						"alignMode": "Screen",
						"instScale": 0.01,
						"instScale_rand": 0.002,
						"instSpeed_rand": [
							0.02,
							0.02,
							0.01
						],
						"warmUpTime": 10,
						"emitRate": 20,
						"maxCount": 100,
						"useRandomColor": true,
						"randomColor1": [
							0.8549019607843137,
							0.6196078431372549,
							0.3137254901960784,
							1
						],
						"randomColor2": [
							0.8941176470588235,
							0.6745098039215687,
							0.3607843137254902,
							0.6941176470588235
						],
						"instSpeed": [
							0,
							0,
							-0.02
						]
					},
					"x": 0.03904,
					"y": -0.28449,
					"z": -0.60774,
					"scaleX": 1.4199999999999997,
					"scaleY": 2.29,
					"scaleZ": 2.05,
					"rotationY": 37.9,
					"rotationZ": -89.2,
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
											"mode": "AfterTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"emissive": 1
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
										"alpha": 0.9,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle.png"
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
														"dt": 0.16666666666666666
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
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
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
							"name": "emitRate",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 2,
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
}