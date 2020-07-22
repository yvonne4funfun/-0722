//
//  ViewController.swift
//  DATE
//
//  Created by 黃芳致 on 2020/7/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dateSlider: UISlider!
    @IBOutlet weak var dateSwitch: UISwitch!
    let imageArray = ["23","24","25","26","27","28","29"]
    var dateString:String = ""
    var timer:Timer?
    var dateCount = 0
    var slidervalue = 0
    let dateFormatter = DateFormatter()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
        datePicker.locale = Locale(identifier: "zh_Tw")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        
        // Do any additional setup after loading the view.
    }
    func compare(){
        if dateCount >= imageArray.count{
            dateCount = 0
            chooseImage(num2:dateCount)
            imageView.image = UIImage(named: imageArray[dateCount])
        }else{chooseImage(num2:dateCount)
            imageView.image = UIImage(named: imageArray[dateCount])
            
        }
        dateSlider.value = Float(dateCount)
        dateCount += 1
    }
    func time(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (timer)in self.compare()}
        }
    
    func chooseImage(num2:Int){
        switch num2{
        case 0:
            dateString = "2019/03/23"
        case 1:
            dateString = "2019/03/24"
        case 2:
            dateString = "2019/03/25"
        case 3:
            dateString = "2019/03/26"
        case 4:
            dateString = "2019/03/27"
        case 5:
            dateString = "2019/03/28"
        case 6:
            dateString = "2019/03/29"
       default:
            dateString = "2019/04/01"
        }
        let date = dateFormatter.date(from: dateString)
        datePicker.date = date!
    }
    
    
    @IBAction func changeImagedatePicker(_ sender: UIDatePicker) {
        let ImageDate = datePicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: ImageDate)
        
        
        let day = dateComponents.day!
        let picName = "\(day)"
        imageView.image = UIImage(named: picName)
        //也可以寫成一行imageView.image = UIImage(named: "\(day)")
        
    }
    @IBAction func yearSlider(_ sender: UISlider) {
        sender.value.round()
        slidervalue = Int(sender.value)
        imageView.image = UIImage(named:imageArray[slidervalue] )
        chooseImage(num2: slidervalue)
        
        
        
    }
   
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
        
        if sender .isOn{
            time()
            dateCount = slidervalue
            dateSlider.value = Float(dateCount)
        }else{
            timer?.invalidate()
        }
        
}
    
    
    
override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}
