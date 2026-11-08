{
	"type": "fx",
	"duration": 1,
	"cullingRadius": 6,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Dust_Blue_Late",
					"props": {
						"instScale_rand": 3,
						"animationSpeed": 0,
						"randomColor1": [
							0.8941176470588235,
							0.8941176470588235,
							0.8941176470588235,
							1
						],
						"randomColor2": [
							0.32156862745098036,
							0.08235294117647059,
							0.17254901960784313,
							0.25098039215686274
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"lifeTime": 6,
						"burstDelay": 0.2,
						"useRandomColor": true,
						"instScale": 11,
						"warmUpTime": 10,
						"burstParticleCount": 10,
						"instAcceleration_rand": [
							0.1,
							0.1,
							0.1
						],
						"emitShape": "Cylinder",
						"speedFactor": 0.3,
						"alignMode": "Screen",
						"lifeTimeRand": 3,
						"maxCount": 3,
						"emitRate": 1
					},
					"z": 2.22711,
					"scaleX": 7,
					"scaleY": 7,
					"scaleZ": 1.5,
					"rotationZ": 82,
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 25
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0404050154622613,
														"dt": -0.17266296001288592
													},
													"nextHandle": {
														"dv": 0.7833333333333333,
														"dt": 0.13
													}
												},
												{
													"time": 0.295,
													"value": 0.9666666666666667,
													"mode": 2
												},
												{
													"time": 0.69,
													"value": 0.9833333333333334,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2333333333333333
													},
													"nextHandle": {
														"dv": 0.0037037037037035425,
														"dt": 0.07036832372657975
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0
												}
											]
										}
									]
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
										"texture": "Fx/Gradients/circGrad3.jpg"
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
										"progress": 0.23,
										"saturation": 1,
										"width": 0.51,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/FlareNoise.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.015,
											0.04
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
										"progress": 0.26,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/FlareNoise.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.06,
											0.03
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
											0.5568627450980392,
											0.34901960784313724,
											1
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
										"power": 0.5
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "SmokePuff",
					"props": {
						"lifeTime": 5,
						"lifeTimeRand": 1,
						"burstParticleCount": 15,
						"emitOrientation": "Normal",
						"emitShape": "Cylinder",
						"emitRad1": 0.61,
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 15,
						"instSpeed_rand": [
							0.05,
							0,
							0
						],
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 2,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instAcceleration_rand": [
							0.05,
							0,
							0
						],
						"warmUpTime": 5,
						"emitRate": 2,
						"maxCount": 8,
						"speedFactor": 0.5
					},
					"z": 1.52982,
					"scaleX": 7,
					"scaleY": 7,
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
									]
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.9
									},
									"isInstance": true,
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
													"time": 0.15,
													"value": 1,
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
											0.596078431372549,
											0.2980392156862745,
											0.796078431372549
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
										"progress": 0.72,
										"saturation": 0,
										"width": 0.84,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.03
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
													"time": 0.2,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.0400050788390025,
														"dt": -0.40358406044498624
													},
													"nextHandle": {
														"dv": -1,
														"dt": 0.38999999999999996
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
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 19.7,
										"power": 14.39
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