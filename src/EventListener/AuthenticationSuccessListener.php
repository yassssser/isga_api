<?php


namespace App\EventListener;

use App\Entity\Etudiant;
use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationSuccessEvent;
use Symfony\Component\Security\Core\User\UserInterface;

class AuthenticationSuccessListener
{

    /**
     * @param AuthenticationSuccessEvent $event
     */
    public function onAuthenticationSuccessResponse(AuthenticationSuccessEvent $event)
    {
        $data = $event->getData();
        $user = $event->getUser();

        if (!$user instanceof Etudiant) {
            return;
        }

        $data['data'] = array(
            'id' => $user->getId()
        );

        $event->setData($data);
    }
}