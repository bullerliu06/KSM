//
//  PBECertPhotosWidget.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit
import AVFoundation

class PBECertPhotosWidget: PBECertBaseVC, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var photoJson = JSON()
    
    var selectImg:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.certTab.delegate = self
        self.certTab.dataSource = self
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuCostumeUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            self.photoJson = suc.feedBaseCall["rxpUltraismJqj"]
            self.findTimeWidget(tt: suc.feedBaseCall["rxpDermopteranJqj"].stringValue)
            self.doneButton.isHidden = !remakeUi(withUnkownstr: self.photoJson["rxpRattlebrainJqj"].stringValue)
            self.certTab.reloadData()
            if !remakeUi(withUnkownstr: self.photoJson["rxpRattlebrainJqj"].stringValue){
                self.showCLosheHsopop(indexPath:IndexPath(row: 0, section: 0))
            }
            
            
        } ffBoom: { errorStr in
            
        }
    }
    
    //MARK: - photoHeadClick
    func photoHeadClick(index:Int){
        if !remakeUi(withUnkownstr: photoJson["rxpRattlebrainJqj"].stringValue){
            if index == 0{
                showCLosheHsopop(indexPath:IndexPath(row: 0, section: 0))
            }else if index == 1{
                let rxpInseverableJqj = photoJson["rxpInseverableJqj"].stringValue
                if remakeUi(withUnkownstr: rxpInseverableJqj){
                    
                    if !remakeUi(withUnkownstr: photoJson["rxpRattlebrainJqj"].stringValue){
                        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                        let openAlbumAction = UIAlertAction(title: "Open Album", style: .default) { _ in
                            self.openAlbum()
                        }
                        actionSheet.addAction(openAlbumAction)
                        let openCameraAction = UIAlertAction(title: "Open Camera", style: .default) { _ in
                            self.openCamera()
                        }
                        actionSheet.addAction(openCameraAction)
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                        actionSheet.addAction(cancelAction)
                        self.present(actionSheet, animated: true, completion: nil)
                    }
                    
                    
                }else{
                    toast("Please Select ID Type")
                }
                
                
            }
            
        }
        
    }
 
    lazy var picker:UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        return picker
    }()
    
    func openAlbum(){
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func openCamera(){
        picker.sourceType = .camera
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video){
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { _ in
                DispatchQueue.main.async {[weak self] in
                    guard let self = self else { return }
                    self.openCamera()
                }
            })
        case .authorized:
            DispatchQueue.main.async {
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker, animated: true)
            }
        default:
            toast("No permission to open the camera, please open it in the settings")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            self.updatePhoto(img: image)
        }
        
    }
    
    
    //MARK: - uploadPhoto
    func updatePhoto(img:UIImage) {
        if let imgData = compressImage(orangeImg: img){
            PBEEFireManWorkLates.kimos.ppRemovedImageVerd(Faloed: "/xjuLeukopoieticUzf",idnfo: ["light":photoJson["rxpInseverableJqj"].stringValue], spitndeer: imgData) { suc in
                let rxpWinceJqj = suc.feedBaseCall["rxpWinceJqj"].stringValue
                if remakeUi(withUnkownstr: rxpWinceJqj){
                    self.photoJson["rxpRattlebrainJqj"].stringValue = rxpWinceJqj
                    self.photoJson["rxpErpJqj"] = suc.feedBaseCall["rxpErpJqj"]
                    
                    self.selectImg = img
                    self.doneButton.isHidden = false
                    self.certTab.reloadData()
                }
                
            } ffasl: { errorStr in
                
            }
            
        }
        
    }
    
    func compressImage(orangeImg:UIImage) -> Data? {
        let maxL = 2 * 1024 * 1024
        var compress:CGFloat = 0.9
        let maxCompress:CGFloat = 0.1
        var imageData = orangeImg.jpegData(compressionQuality: compress)
        while (imageData?.count)! > maxL && compress > maxCompress {
            compress -= 0.1
            imageData = orangeImg.jpegData(compressionQuality: compress)
        }
        return imageData
    }
    
    
    //MARK: - runGoForward
    override func runGoForward(_ sender: Any) {
        PERABEEDeviceTool.updataDeviceinfo()
        var dic:[String:Any] = ["rxpTrombonistJqj":currentPid,"point":getNewPP()]
        dic["rxpChasseurJqj"] = photoJson["rxpRattlebrainJqj"].stringValue
        
        for josn in photoJson["rxpErpJqj"].arrayValue{
            let keuys = josn["rxpBenthamismJqj"].stringValue
            let vauelas = josn["rxpRattlebrainJqj"].stringValue
            
            if vauelas.count>0,vauelas != "0"{
                dic[keuys] = vauelas
            }else{
                if josn["rxpHeitikiJqj"].intValue == 0{
                    if josn["rxpHeadfirstJqj"] == "zmhghwcrt"{
                        toast("Please Select \(josn["rxpOverrigidJqj"].stringValue)")
                    }else{
                        toast("Please fill in \(josn["rxpOverrigidJqj"].stringValue)")
                    }
                    return
                }
            }
        }
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuEmbowerUzf", tracking: dic,ibloadfod: true) { suc in
            self.localSucDeal(deals: suc.feedBaseCall)
            
        } ffBoom: { errorStr in
            
        }
        
    }

}

extension PBECertPhotosWidget:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rxpRattlebrainJqj = photoJson["rxpRattlebrainJqj"].stringValue
        if remakeUi(withUnkownstr: rxpRattlebrainJqj){
            return 1+photoJson["rxpErpJqj"].arrayValue.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 300
        }else{
            return 46
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetPhotoHeadCell", owner: self, options: nil)?.first as? PBECertBaseWidgetPhotoHeadCell {
                cell.hgaorrL0adCell(cellData: photoJson,img: selectImg)
                cell.clickBLiieak = { index in
                    self.photoHeadClick(index: index)
                }
                return cell
            }
        }else{
            let cellData = photoJson["rxpErpJqj"].arrayValue[indexPath.row-1]
            let urlas = cellData["rxpHeadfirstJqj"].stringValue
            if (urlas == "klnesopqz" || urlas == "nxrvwfzwr"),let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetTableViewCell", owner: self, options: nil)?.first as? PBECertBaseWidgetTableViewCell {
                
                cell.bettrayJsons(datst: cellData)
                cell.clickBalcik = {
                    self.showCLosheHsopop(indexPath: indexPath)
                }
                return cell
            }else if urlas == "ocdmohmwn",let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetTxtTableViewCell", owner: self, options: nil)?.first as? PBECertBaseWidgetTxtTableViewCell {
                
                cell.bettrayJsons(datst: cellData, tabse: self.certTab)
                cell.clickBalcik = { txt in
                    self.reloadTbas(vaule: txt, indexPath: indexPath)
                }
                return cell
            }else if urlas == "zmhghwcrt",let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetPhotoGenderCell", owner: self, options: nil)?.first as? PBECertBaseWidgetPhotoGenderCell {
                cell.hdeeriLAber(ifer: cellData)
                cell.clickBLiieak = { txt in
                    self.reloadTbas(vaule: txt, indexPath: indexPath)
                }
                return cell
            }
            
        }
        
        return UITableViewCell()
    }
    
    func showCLosheHsopop(indexPath:IndexPath){
        
        if indexPath.row == 0{
            let _ = PBECertBaseWidgetPopSelectOneView(popJson:photoJson,isId: true) { selectedValue in
                self.reloadTbas(vaule: selectedValue, indexPath: indexPath)
            }
        }else{
            let jsons = photoJson["rxpErpJqj"][indexPath.row-1]
            let urlas = jsons["rxpHeadfirstJqj"].stringValue
            if urlas == "klnesopqz"{
                let _ = PBECertBaseWidgetPopSelectView(popJson:jsons) { selectedValue in
                    self.reloadTbas(vaule: selectedValue, indexPath: indexPath)
                }
            }else if urlas == "nxrvwfzwr"{
                
                let basicTimeSing = PBECertBaseWidgetPopSelectTimeView(dateStr: jsons["rxpRattlebrainJqj"].string, title: jsons["rxpUmbJqj"].stringValue)
                basicTimeSing.show()
                basicTimeSing.selectBlock = { dataStr  in
                    self.reloadTbas(vaule: dataStr, indexPath: indexPath)
                }
            }
            
        }
        
    }
    
    func reloadTbas(vaule:String,indexPath:IndexPath){
        view.endEditing(true)
        if indexPath.row == 0{
            photoJson["rxpInseverableJqj"].stringValue = vaule
            certTab.reloadRows(at: [indexPath], with: .none)
        }else{
            photoJson["rxpErpJqj"][indexPath.row-1]["rxpRattlebrainJqj"].stringValue = vaule
            certTab.reloadRows(at: [indexPath], with: .none)
            showohNJOpennNEts(indexPath: indexPath)
        }
        
    }
    
    func showohNJOpennNEts(indexPath:IndexPath){
        let jsonList = photoJson["rxpErpJqj"].arrayValue
        guard jsonList.count > indexPath.row + 1 else { return }
        let jsons = jsonList[indexPath.row+1]
        let isEnaictxt = jsons["rxpRattlebrainJqj"].stringValue
        if isEnaictxt.count == 0{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.24) {
                if let cell = self.certTab.cellForRow(at: IndexPath(row: indexPath.row+1, section: indexPath.section)) as? PBECertBaseWidgetTableViewCell{
                    cell.clickBalcik?()
                    
                    if cell.isDescendant(of: self.certTab) {
                        let newOffset = self.certTab.contentOffset.y + cell.frame.size.height
                        self.certTab.setContentOffset(CGPoint(x: self.certTab.contentOffset.x, y: newOffset), animated: true)
                    }
                }
                
                
                
            }
        }
        
    }
    
}
