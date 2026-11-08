{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44,
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
					"type": "object",
					"name": "testHextilepattern",
					"x": -3.42733,
					"y": -9.48146,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"rotationZ": -10.1,
					"children": [
						{
							"type": "object",
							"name": "1",
							"x": 2.220446049250313e-16,
							"y": -1.7763568394002505e-15,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationZ": -1.5902773407317582e-15,
							"children": [
								{
									"type": "advancedDecal",
									"name": "PatternIn",
									"x": -2.220446049250313e-16,
									"y": -1.7763568394002505e-15,
									"scaleX": 150.0000000000001,
									"scaleY": 150.0000000000001,
									"scaleZ": 50.00000000000001,
									"rotationZ": 89.99999999999999,
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
												"alpha": 0.2,
												"uScale": 4,
												"vScale": 4,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/PatternFlower02.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/PatternFlower_dissolve.png",
												"uvShift": [
													0,
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9889622926266206,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33404486857997995
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33404486857997995
															}
														},
														{
															"time": 3.989840650845194,
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
									"type": "advancedDecal",
									"name": "PatternOut",
									"x": -2.220446049250313e-16,
									"y": -1.7763568394002505e-15,
									"scaleX": 150.0000000000001,
									"scaleY": 150.0000000000001,
									"scaleZ": 50.00000000000001,
									"rotationZ": 89.99999999999999,
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
												"alpha": 0.6,
												"uScale": 4,
												"vScale": 4,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/PatternFlower01.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/PatternFlower_dissolve.png",
												"uvShift": [
													0,
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
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.0021346057399398,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.33404486857997995
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.33404486857997995
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
									"name": "PatternOutGrow",
									"x": -2.220446049250313e-16,
									"y": -1.7763568394002505e-15,
									"scaleX": 150.0000000000001,
									"scaleY": 150.0000000000001,
									"scaleZ": 50.00000000000001,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1,
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
												"alpha": 0.5,
												"uScale": 4,
												"vScale": 4,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/PatternFlower03.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/PatternFlower_dissolve.png",
												"uvShift": [
													0,
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.994700619566488,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3315668731888293
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6684331268111707
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.6686704228910436
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.6741754135237152
															}
														},
														{
															"time": 5.020555688190447,
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
									"type": "advancedDecal",
									"name": "PatternOutGrow",
									"enabled": false,
									"x": -2.220446049250313e-16,
									"y": -1.7763568394002505e-15,
									"scaleX": 150.0000000000001,
									"scaleY": 150.0000000000001,
									"scaleZ": 50.00000000000001,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.8,
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
												"alpha": 0.5,
												"uScale": 4,
												"vScale": 4,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/PatternFlower01.png"
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
												"progress": 0.32,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/Alphas/T_SpiceAlpha.png",
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/PatternFlower_dissolve.png",
												"uvShift": [
													0,
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.994700619566488,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3315668731888293
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6684331268111707
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.6686704228910436
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.6741754135237152
															}
														},
														{
															"time": 5.020555688190447,
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
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									}
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
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				}
			]
		}
	]
}