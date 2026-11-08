{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Bokeh",
					"props": {
						"alignMode": "Screen",
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
						"emitAngle": 0,
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							-5
						],
						"emitType": "Burst",
						"burstDelay": 0.12,
						"warmUpTime": -0.095,
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"lifeTime": 1.5,
						"instScale": 2,
						"instStretch": [
							1.6,
							1,
							1
						],
						"instRotation": [
							0,
							0,
							-45
						],
						"frameCount": 2,
						"frameDivisionY": 2,
						"spriteSheet": "Fx/Alphas/T_Boquet_straight_circle_2x1.png",
						"instStretch_rand": [
							0.2,
							0,
							0
						]
					},
					"x": 0.2866666666666666,
					"y": 0.11333333333333337,
					"z": -1.0533333333333328,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "model",
							"name": "PlanePivBot_NoVrtx",
							"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
							"rotationY": 90,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 20
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"color": [
										0.7058823529411764,
										0.9254901960784314,
										0.9411764705882353,
										1
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.09
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2619278819653144,
														"dt": -0.3266166282733753
													},
													"nextHandle": {
														"dv": -0.85,
														"dt": 0.22000000000000003
													}
												},
												{
													"time": 1,
													"value": 0.033333333333333326,
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
											0.6941176470588235,
											0.4156862745098039,
											0.2588235294117647
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
										"range": 1,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keys": [
								{
									"time": 0,
									"value": 1.0666666666666667,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.85,
									"mode": 0,
									"prevHandle": {
										"dv": -0.19044784291591613,
										"dt": -0.5609157100618063
									},
									"nextHandle": {
										"dv": 0.14507904052734366,
										"dt": 0.43
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.00564231872558596,
										"dt": -0.45000000000000007
									},
									"nextHandle": {
										"dv": 0.00433869348958209,
										"dt": 0.33432171256113974
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "LensFlare_circle",
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 1.5,
						"maxCount": 5,
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
						"emitAngle": 0,
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"instScale": 5.5,
						"emitType": "Burst",
						"burstDelay": 0.12,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -0.1,
						"instOffset": [
							1.5,
							0,
							0
						],
						"instRotation": [
							0,
							0,
							-40
						],
						"instOffset_rand": [
							0.2,
							0,
							0
						]
					},
					"x": -0.14,
					"y": -0.23,
					"z": 0.55,
					"scaleX": 0.09999999999999999,
					"scaleY": 0.09999999999999999,
					"scaleZ": 0.09999999999999999,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 10
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
										"alpha": 0.07,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_01.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2619278819653144,
														"dt": -0.3266166282733753
													},
													"nextHandle": {
														"dv": -0.85,
														"dt": 0.22000000000000003
													}
												},
												{
													"time": 1,
													"value": 0.033333333333333326,
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
										"range": 1,
										"power": 1
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
											0.6941176470588235,
											0.3607843137254902,
											0.2588235294117647
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keys": [
								{
									"time": 0,
									"value": 1.0666666666666667,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1,
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