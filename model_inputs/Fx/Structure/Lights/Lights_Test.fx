{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "shader",
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"props": {
						"REVERSE": false,
						"range": 0.1,
						"power": 1
					},
					"isInstance": true
				},
				{
					"type": "lookAt",
					"name": "lookAt - locked",
					"x": 0.07,
					"y": 0.04,
					"z": 0.62,
					"scaleX": 0.39999999999999997,
					"scaleY": 0.4,
					"scaleZ": 0.39999999999999997,
					"rotationY": -132.17909483611095,
					"target": "camera",
					"lockAxis": [
						0,
						1,
						0
					],
					"children": [
						{
							"type": "polygon",
							"name": "middle hexagony",
							"x": 0.10000000000000009,
							"z": 5.551115123125783e-17,
							"scaleX": 0.4856470728996938,
							"scaleY": 0.3885176583197551,
							"scaleZ": 0.9712941457993876,
							"rotationX": -90.00000000000001,
							"rotationY": 3.1805546814635183e-15,
							"rotationZ": -90.00000000000004,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Structure/Lights/T_Hexagon02.png",
									"color": [
										0.2549019607843137,
										0.9333333333333333,
										1,
										1
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.09499999999999999,
											"value": 0.95,
											"mode": 2
										},
										{
											"time": 0.21000000000000002,
											"value": 1.04375,
											"mode": 2
										},
										{
											"time": 0.32,
											"value": 0.93125,
											"mode": 2
										},
										{
											"time": 0.5549999999999999,
											"value": 1.0145833333333334,
											"mode": 2
										},
										{
											"time": 0.715,
											"value": 0.9614583333333333,
											"mode": 2
										},
										{
											"time": 0.875,
											"value": 1.04375,
											"mode": 2
										},
										{
											"time": 1.05,
											"value": 0.978125,
											"mode": 2
										},
										{
											"time": 1.2049999999999998,
											"value": 1.0197916666666667,
											"mode": 2
										},
										{
											"time": 1.4,
											"value": 0.9552083333333333,
											"mode": 2
										},
										{
											"time": 1.655,
											"value": 1.0572916666666667,
											"mode": 2
										},
										{
											"time": 1.795,
											"value": 0.9625,
											"mode": 2
										},
										{
											"time": 1.9,
											"value": 1.0208333333333333,
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
	]
}