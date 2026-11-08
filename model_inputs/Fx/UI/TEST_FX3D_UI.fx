{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "DiskFlat",
					"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": -90,
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
									"culling": "Back",
									"colorMask": 255,
									"emissive": 2
								}
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
								"progress": 0.15,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/T_Flare04.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.8,
									0
								]
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
						"instScale": 0.3,
						"instScale_rand": 0.1,
						"instSpeed_rand": [
							0.4,
							0.4,
							0.4
						],
						"warmUpTime": 10,
						"emitRate": 20,
						"maxCount": 100,
						"useRandomColor": true,
						"randomColor1": [
							0.5176470588235293,
							0.23137254901960785,
							0.13333333333333333,
							1
						],
						"randomColor2": [
							0.8941176470588235,
							0.6745098039215687,
							0.3607843137254902,
							0.6941176470588235
						],
						"instSpeed": [
							-0.1,
							-0.1,
							-0.2
						]
					},
					"scaleX": 0.1,
					"scaleY": 2,
					"scaleZ": 2,
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
											"emissive": 2
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
						}
					]
				}
			]
		}
	]
}