{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "middle hexagony",
					"scaleX": 0.24,
					"scaleY": 0.18,
					"scaleZ": 0.4068413978494624,
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
							"diffuseMap": "Fx/Structure/Lights/circGrad01.png",
							"color": [
								0,
								0.8313725490196078,
								0.9098039215686274,
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