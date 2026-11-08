{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"z": 0.02,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "group",
					"z": 0.28565,
					"children": [
						{
							"type": "advancedDecal",
							"name": "NUCLEAR",
							"scaleX": 27,
							"scaleY": 27,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T_NuclearSign.png",
							"fadeStart": 0.95,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 10,
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
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.40784313725490196,
											0.3686274509803922,
											0.2627450980392157
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CIRCLE CUT",
							"scaleX": 90,
							"scaleY": 90,
							"scaleZ": 90,
							"albedoMap": "Fx/Alphas/T_circle_2.png",
							"fadeStart": 0.95,
							"emissive": 1,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 15,
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
										"alpha": 0.8
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
										"progress": 0.71,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.996078431372549,
											0.42745098039215684
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CIRCLE",
							"scaleX": 65,
							"scaleY": 65,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/FloorScan_Round_08.png",
							"fadeStart": 0.95,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 15,
											"value": -1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.15
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
										"progress": 0.71,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.42745098039215684,
											1,
											0.5568627450980392
										]
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0.6627450980392157,
									0.42745098039215684
								]
							}
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
											"value": 0.6,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8333333333333334
											}
										},
										{
											"time": 2.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0011111111111110628,
												"dt": -0.470650345188671
											},
											"nextHandle": {
												"dv": -9.94488997715004e-17,
												"dt": 0.47370225794864934
											}
										},
										{
											"time": 5,
											"value": 0.4,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.8333333333333334
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.8333333333333334
											}
										},
										{
											"time": 7.5,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0183333333333332,
												"dt": -0.5479704894582191
											},
											"nextHandle": {
												"dv": 0.01703690560811125,
												"dt": 0.5366619456476727
											}
										},
										{
											"time": 10.06637799069778,
											"value": 0.5855555555555556,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03722222222222227,
												"dt": -0.5163065636539876
											},
											"nextHandle": {
												"dv": -0.03722222222222227,
												"dt": 0.5163065636539876
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
					"name": "group",
					"visible": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "NUCLEAR",
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
							"rotationZ": 90,
							"albedoMap": "Fx/Alphas/T_LogoNuke_1.png",
							"fadeStart": 1,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CIRCLE CUT",
							"x": 20.96514,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
							"rotationZ": 90,
							"albedoMap": "Fx/Alphas/T_LogoNuke_2.png",
							"fadeStart": 1,
							"emissive": 1,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
										"progress": 0.71,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
							"type": "advancedDecal",
							"name": "CIRCLE",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
							"rotationZ": 90,
							"albedoMap": "Fx/Alphas/T_LogoNuke_3.png",
							"fadeStart": 1,
							"renderMode": "AfterTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
										"progress": 0.71,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Lines.png",
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
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									1,
									1
								]
							}
						}
					]
				}
			]
		}
	]
}