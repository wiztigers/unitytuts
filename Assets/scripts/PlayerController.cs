using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour {

	public float Speed;

	private Rigidbody body;

	void Start() {
		body = GetComponent<Rigidbody>();
		Debug.Log("player:start");
	}
	
	// Update is called once per frame
//	void Update() { }

	void FixedUpdate() {
		float xMove = Input.GetAxis("Horizontal");
		float zMove = Input.GetAxis("Vertical");
		Vector3 move = new Vector3(xMove, 0.0f, zMove);
		body.AddForce(move * Speed);
	}

	void OnTriggerEnter(Collider other) {
		Debug.Log("player:collide");
		if (other.gameObject.CompareTag("PickUp")) {
			other.gameObject.SetActive(false);
			//Destroy(other.gameObject);
		}
	}
}
