


import UIKit


protocol AllUsersViewToAllUsersPresenter {
    var view:AllUsersPresenterToAllUsersView? { get set }
    var interactor:AllUsersPresenterToAllUsersInteractor? { get set }
    var router:AllUsersPresenterToAllUsersRouter? { get set }
    
    func viewDidLoad()
    func switchAction(_ User:[user])
}

protocol AllUsersPresenterToAllUsersView : AnyObject {
    func successfullyGotData(_ User:[user])
}

protocol AllUsersInteractorToAllUsersPresenter : AnyObject {
    func fetchedDataOfUser(_ User:[user])
}

protocol AllUsersPresenterToAllUsersInteractor {
    var presenter:AllUsersInteractorToAllUsersPresenter? { get set }
    var userDetails:[user]? { get set }
    func getDataOfUser()
    func addDataOfUser(_ User:[user])
}

protocol AllUsersPresenterToAllUsersRouter {
    static func createModule(_ User:[user]) -> UIViewController?
}
