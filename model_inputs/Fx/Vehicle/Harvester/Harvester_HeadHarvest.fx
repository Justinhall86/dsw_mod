{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"enabled": false,
			"children": [
				{
					"type": "reference",
					"name": "PreviewScene",
					"source": "Fx/FX_PreviewScene.l3d",
					"locked": true
				},
				{
					"type": "model",
					"name": "Vehicule_Harvester",
					"source": "Vehicle/Atreide/Harvester/Vehicule_Harvester.fbx",
					"x": -0.6,
					"y": -2.08
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "emitter - sand 01",
					"props": {
						"lifeTime": 2.8,
						"emitRate": 25,
						"alignMode": "Screen",
						"instWorldSpeed_rand": [
							0.06,
							0.06,
							0
						],
						"instStartWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 0.2,
						"instScale": 0.4,
						"maxCount": 100,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"instStartSpeed_rand": [
							0,
							0,
							0
						],
						"instRotation_rand": [
							5,
							5,
							360
						],
						"emitOrientation": "Normal",
						"simulationSpace": "World",
						"emitShape": "Cylinder",
						"instOffset_rand": [
							0.1,
							0.1,
							0.1
						],
						"instStretch_rand": [
							0.2,
							0.2,
							0.2
						],
						"instSpeed": [
							0,
							0.08,
							0
						],
						"lifeTimeRand": 0.3,
						"emitAngle": 360
					},
					"x": -0.19,
					"z": -0.1,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "model",
							"name": "HemiIcosphere",
							"source": "Fx/Meshes_Common/HemiIcosphere.fbx",
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Environment/Texture/Ground/SandNoise_roughmask.png",
									"specularMap": "Fx/Gradients/z_FillBlack.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": false,
										"texture": "Fx/Vehicle/Harvester/T_Sand01_A.png",
										"uvScale": [
											1,
											1
										],
										"uvDelta": [
											0,
											0
										],
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"onDecal": false
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.29000000000000004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7649999999999999,
													"value": 0.65,
													"mode": 2
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
										"useSourceUVs": true,
										"wrap": false,
										"texture": "Fx/Vehicle/Harvester/circGrad.png",
										"uvScale": [
											1,
											1
										],
										"uvDelta": [
											0,
											0
										],
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Dissolve",
									"source": "shaders/Dissolve.hx",
									"props": {
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"useAlpha": false
									},
									"isInstance": true,
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
													"time": 0.195,
													"value": 0.35,
													"mode": 2
												},
												{
													"time": 0.51,
													"value": 0.5,
													"mode": 2
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
										"range": 0.5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6666666666666666,
											0.36470588235294116,
											0.23137254901960785
										]
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereSide.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.2,
									"dirSpan": 0.81
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
									"value": 0.5327777777777777,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.09666666666666668,
										"dt": -0.5800000000000001
									},
									"nextHandle": {
										"dv": 0.05599028678161667,
										"dt": 0.3359417206897011
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instRotation.z",
							"keys": [
								{
									"time": 0.015,
									"value": 0.13333333333333333,
									"mode": 2
								},
								{
									"time": 1,
									"value": -2,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keys": [
								{
									"time": 0.14500000000000002,
									"value": -0.23333333333333334,
									"mode": 2
								},
								{
									"time": 0.815,
									"value": 0.2,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"props": {
								"tag": "WIP"
							},
							"keys": [
								{
									"time": 0,
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