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
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44000000000000017,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 150,
					"scaleY": 150,
					"scaleZ": 50,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 3,
					"renderMode": "BeforeTonemapping",
					"children": [
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
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/FloorScan_Round_08.png"
							},
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
											"time": 0.46,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9949999999999999,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "uOffset",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.17,
								"saturation": 0,
								"width": 1,
								"useAlpha": true
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1.9999999999999998,
									"value": 0.5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 50,
					"rotationZ": 90,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 3,
					"renderMode": "BeforeTonemapping",
					"children": [
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
								"alpha": 0.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/T_ValidationPicto.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "uOffset",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 1,
								"saturation": 0,
								"width": 1,
								"useAlpha": true
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keys": [
										{
											"time": 0.505,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5799999999999998,
											"value": 1,
											"mode": 2
										}
									]
								}
							],
							"isInstance": true
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1333333333333333,
									"mode": 2
								},
								{
									"time": 2.0050000000000003,
									"value": 1.4333333333333333,
									"mode": 2
								}
							]
						}
					],
					"enabled": false
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 50,
					"rotationZ": 90,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 3,
					"renderMode": "BeforeTonemapping",
					"children": [
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
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/T_SpyingPicto.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "uOffset",
									"enabled": false,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								},
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
												"dt": 0.17833333333333332
											}
										},
										{
											"time": 0.5299999999999999,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.0699999999999999
											},
											"nextHandle": {
												"dv": -7.960308864436226e-16,
												"dt": 0.9750128204285313
											}
										},
										{
											"time": 1.555,
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
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.29,
								"saturation": 0,
								"width": 1,
								"useAlpha": true
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
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
					"type": "shader",
					"name": "EnvColorMult",
					"source": "shaders/EnvColorMult.hx",
					"props": {
						"sandBlend": 0.5,
						"sandColorSet": false,
						"envBlend": 1,
						"envColorSet": false
					},
					"isInstance": true
				}
			]
		}
	]
}