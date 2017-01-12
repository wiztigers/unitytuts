using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour {

	public float Speed;
	/// <summary>TODO: gameplay logic shouldn't be known by player</summary>
	public UnityEngine.UI.Text Text;

	private Rigidbody body;
	private int count;
	private int Score {
		get { return count; }
		set {
			count = value;
			if (count >= 12) {
				Text.text = "Game Over";
				Text.rectTransform.anchorMin = new Vector2(.5f,.5f);
				Text.rectTransform.anchorMax = new Vector2(.5f,.5f);
				Text.rectTransform.pivot     = new Vector2(.5f,.5f);
			}
			else Text.text = "Score: "+count;
		}
	}

	void Start() {
		body = GetComponent<Rigidbody>();
		Score = 0;
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
		if (other.gameObject.CompareTag("PickUp")) {
			Score++;
			other.gameObject.SetActive(false);
			//Destroy(other.gameObject);
		}
	}
}
